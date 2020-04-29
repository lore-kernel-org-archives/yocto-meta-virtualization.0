Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2082.1588199804446974011
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 15:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03TMZqtK022814
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2020 15:36:33 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 15:36:11 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 66F96900659;
 Wed, 29 Apr 2020 15:36:11 -0700 (PDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] ceph: backport CVE fixes
Date: Wed, 29 Apr 2020 15:36:08 -0700
Message-ID: <20200429223608.137664-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix CVE-2020-1759 and CVE-2020-1760
PR for fix: https://github.com/ceph/ceph/pull/34482

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...olV2-avoid-AES-GCM-nonce-reuse-vulne.patch | 256 ++++++++++++++++++
 ...pto_onwire-fix-endianness-of-nonce_t.patch |  61 +++++
 ...001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch |  33 +++
 ...ol-characters-in-response-header-act.patch |  64 +++++
 ...uthenticated-response-header-actions.patch |  36 +++
 recipes-extended/ceph/ceph_15.2.0.bb          |   5 +
 6 files changed, 455 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch

diff --git a/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch b/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch
new file mode 100644
index 0000000..5415669
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch
@@ -0,0 +1,256 @@
+From 20b7bb685c5ea74c651ca1ea547ac66b0fee7035 Mon Sep 17 00:00:00 2001
+From: Ilya Dryomov <idryomov@gmail.com>
+Date: Fri, 6 Mar 2020 20:16:45 +0100
+Subject: [PATCH] msg/async/ProtocolV2: avoid AES-GCM nonce reuse
+ vulnerabilities
+
+The secure mode uses AES-128-GCM with 96-bit nonces consisting of a
+32-bit counter followed by a 64-bit salt.  The counter is incremented
+after processing each frame, the salt is fixed for the duration of
+the session.  Both are initialized from the session key generated
+during session negotiation, so the counter starts with essentially
+a random value.  It is allowed to wrap, and, after 2**32 frames, it
+repeats, resulting in nonce reuse (the actual sequence numbers that
+the messenger works with are 64-bit, so the session continues on).
+
+Because of how GCM works, this completely breaks both confidentiality
+and integrity aspects of the secure mode.  A single nonce reuse reveals
+the XOR of two plaintexts and almost completely reveals the subkey
+used for producing authentication tags.  After a few nonces get used
+twice, all confidentiality and integrity goes out the window and the
+attacker can potentially encrypt-authenticate plaintext of their
+choice.
+
+We can't easily change the nonce format to extend the counter to
+64 bits (and possibly XOR it with a longer salt).  Instead, just
+remember the initial nonce and cut the session before it repeats,
+forcing renegotiation.
+
+Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
+Reviewed-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
+Reviewed-by: Sage Weil <sage@redhat.com>
+
+Conflicts:
+	src/msg/async/ProtocolV2.h [ context: commit ed3ec4c01d17
+	  ("msg: Build target 'common' without using namespace in
+	  headers") not in octopus ]
+
+CVE: CVE-2020-1759
+Upstream Status: Backport [20b7bb685c5ea74c651ca1ea547ac66b0fee7035]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/msg/async/ProtocolV2.cc    | 62 ++++++++++++++++++++++++----------
+ src/msg/async/ProtocolV2.h     |  5 +--
+ src/msg/async/crypto_onwire.cc | 17 ++++++++--
+ src/msg/async/crypto_onwire.h  |  5 +++
+ 4 files changed, 67 insertions(+), 22 deletions(-)
+
+diff --git a/src/msg/async/ProtocolV2.cc b/src/msg/async/ProtocolV2.cc
+index 8fc02db6e5..c69f2ccf79 100644
+--- a/src/msg/async/ProtocolV2.cc
++++ b/src/msg/async/ProtocolV2.cc
+@@ -533,7 +533,10 @@ ssize_t ProtocolV2::write_message(Message *m, bool more) {
+ 			     m->get_payload(),
+ 			     m->get_middle(),
+ 			     m->get_data());
+-  connection->outgoing_bl.append(message.get_buffer(session_stream_handlers));
++  if (!append_frame(message)) {
++    m->put();
++    return -EILSEQ;
++  }
+ 
+   ldout(cct, 5) << __func__ << " sending message m=" << m
+                 << " seq=" << m->get_seq() << " " << *m << dendl;
+@@ -566,15 +569,17 @@ ssize_t ProtocolV2::write_message(Message *m, bool more) {
+   return rc;
+ }
+ 
+-void ProtocolV2::append_keepalive() {
+-  ldout(cct, 10) << __func__ << dendl;
+-  auto keepalive_frame = KeepAliveFrame::Encode();
+-  connection->outgoing_bl.append(keepalive_frame.get_buffer(session_stream_handlers));
+-}
+-
+-void ProtocolV2::append_keepalive_ack(utime_t &timestamp) {
+-  auto keepalive_ack_frame = KeepAliveFrameAck::Encode(timestamp);
+-  connection->outgoing_bl.append(keepalive_ack_frame.get_buffer(session_stream_handlers));
++template <class F>
++bool ProtocolV2::append_frame(F& frame) {
++  ceph::bufferlist bl;
++  try {
++    bl = frame.get_buffer(session_stream_handlers);
++  } catch (ceph::crypto::onwire::TxHandlerError &e) {
++    ldout(cct, 1) << __func__ << " " << e.what() << dendl;
++    return false;
++  }
++  connection->outgoing_bl.append(bl);
++  return true;
+ }
+ 
+ void ProtocolV2::handle_message_ack(uint64_t seq) {
+@@ -612,7 +617,15 @@ void ProtocolV2::write_event() {
+   connection->write_lock.lock();
+   if (can_write) {
+     if (keepalive) {
+-      append_keepalive();
++      ldout(cct, 10) << __func__ << " appending keepalive" << dendl;
++      auto keepalive_frame = KeepAliveFrame::Encode();
++      if (!append_frame(keepalive_frame)) {
++        connection->write_lock.unlock();
++        connection->lock.lock();
++        fault();
++        connection->lock.unlock();
++        return;
++      }
+       keepalive = false;
+     }
+ 
+@@ -663,13 +676,16 @@ void ProtocolV2::write_event() {
+     if (r == 0) {
+       uint64_t left = ack_left;
+       if (left) {
+-        auto ack = AckFrame::Encode(in_seq);
+-        connection->outgoing_bl.append(ack.get_buffer(session_stream_handlers));
+         ldout(cct, 10) << __func__ << " try send msg ack, acked " << left
+                        << " messages" << dendl;
+-        ack_left -= left;
+-        left = ack_left;
+-        r = connection->_try_send(left);
++        auto ack_frame = AckFrame::Encode(in_seq);
++        if (append_frame(ack_frame)) {
++          ack_left -= left;
++          left = ack_left;
++          r = connection->_try_send(left);
++        } else {
++          r = -EILSEQ;
++        }
+       } else if (is_queued()) {
+         r = connection->_try_send();
+       }
+@@ -769,7 +785,13 @@ template <class F>
+ CtPtr ProtocolV2::write(const std::string &desc,
+                         CONTINUATION_TYPE<ProtocolV2> &next,
+                         F &frame) {
+-  ceph::bufferlist bl = frame.get_buffer(session_stream_handlers);
++  ceph::bufferlist bl;
++  try {
++    bl = frame.get_buffer(session_stream_handlers);
++  } catch (ceph::crypto::onwire::TxHandlerError &e) {
++    ldout(cct, 1) << __func__ << " " << e.what() << dendl;
++    return _fault();
++  }
+   return write(desc, next, bl);
+ }
+ 
+@@ -1672,7 +1694,11 @@ CtPtr ProtocolV2::handle_keepalive2(ceph::bufferlist &payload)
+   ldout(cct, 30) << __func__ << " got KEEPALIVE2 tag ..." << dendl;
+ 
+   connection->write_lock.lock();
+-  append_keepalive_ack(keepalive_frame.timestamp());
++  auto keepalive_ack_frame = KeepAliveFrameAck::Encode(keepalive_frame.timestamp());
++  if (!append_frame(keepalive_ack_frame)) {
++    connection->write_lock.unlock();
++    return _fault();
++  }
+   connection->write_lock.unlock();
+ 
+   ldout(cct, 20) << __func__ << " got KEEPALIVE2 "
+diff --git a/src/msg/async/ProtocolV2.h b/src/msg/async/ProtocolV2.h
+index 2dbe647ae5..9897d18cf2 100644
+--- a/src/msg/async/ProtocolV2.h
++++ b/src/msg/async/ProtocolV2.h
+@@ -129,6 +129,9 @@ private:
+                         CONTINUATION_TYPE<ProtocolV2> &next,
+                         bufferlist &buffer);
+ 
++  template <class F>
++  bool append_frame(F& frame);
++
+   void requeue_sent();
+   uint64_t discard_requeued_up_to(uint64_t out_seq, uint64_t seq);
+   void reset_recv_state();
+@@ -140,8 +143,6 @@ private:
+   void prepare_send_message(uint64_t features, Message *m);
+   out_queue_entry_t _get_next_outgoing();
+   ssize_t write_message(Message *m, bool more);
+-  void append_keepalive();
+-  void append_keepalive_ack(utime_t &timestamp);
+   void handle_message_ack(uint64_t seq);
+ 
+   CONTINUATION_DECL(ProtocolV2, _wait_for_peer_banner);
+diff --git a/src/msg/async/crypto_onwire.cc b/src/msg/async/crypto_onwire.cc
+index acf3f66689..07e7fe6553 100644
+--- a/src/msg/async/crypto_onwire.cc
++++ b/src/msg/async/crypto_onwire.cc
+@@ -22,6 +22,10 @@ static constexpr const std::size_t AESGCM_BLOCK_LEN{16};
+ struct nonce_t {
+   std::uint32_t random_seq;
+   std::uint64_t random_rest;
++
++  bool operator==(const nonce_t& rhs) const {
++    return !memcmp(this, &rhs, sizeof(*this));
++  }
+ } __attribute__((packed));
+ static_assert(sizeof(nonce_t) == AESGCM_IV_LEN);
+ 
+@@ -35,7 +39,8 @@ class AES128GCM_OnWireTxHandler : public ceph::crypto::onwire::TxHandler {
+   CephContext* const cct;
+   std::unique_ptr<EVP_CIPHER_CTX, decltype(&::EVP_CIPHER_CTX_free)> ectx;
+   ceph::bufferlist buffer;
+-  nonce_t nonce;
++  nonce_t nonce, initial_nonce;
++  bool used_initial_nonce;
+   static_assert(sizeof(nonce) == AESGCM_IV_LEN);
+ 
+ public:
+@@ -44,7 +49,7 @@ public:
+ 			    const nonce_t& nonce)
+     : cct(cct),
+       ectx(EVP_CIPHER_CTX_new(), EVP_CIPHER_CTX_free),
+-      nonce(nonce) {
++      nonce(nonce), initial_nonce(nonce), used_initial_nonce(false) {
+     ceph_assert_always(ectx);
+     ceph_assert_always(key.size() * CHAR_BIT == 128);
+ 
+@@ -61,6 +66,7 @@ public:
+ 
+   ~AES128GCM_OnWireTxHandler() override {
+     ::ceph::crypto::zeroize_for_security(&nonce, sizeof(nonce));
++    ::ceph::crypto::zeroize_for_security(&initial_nonce, sizeof(initial_nonce));
+   }
+ 
+   std::uint32_t calculate_segment_size(std::uint32_t size) override
+@@ -78,6 +84,13 @@ public:
+ void AES128GCM_OnWireTxHandler::reset_tx_handler(
+   std::initializer_list<std::uint32_t> update_size_sequence)
+ {
++  if (nonce == initial_nonce) {
++    if (used_initial_nonce) {
++      throw ceph::crypto::onwire::TxHandlerError("out of nonces");
++    }
++    used_initial_nonce = true;
++  }
++
+   if(1 != EVP_EncryptInit_ex(ectx.get(), nullptr, nullptr, nullptr,
+       reinterpret_cast<const unsigned char*>(&nonce))) {
+     throw std::runtime_error("EVP_EncryptInit_ex failed");
+diff --git a/src/msg/async/crypto_onwire.h b/src/msg/async/crypto_onwire.h
+index bd682e8c71..0c544f205a 100644
+--- a/src/msg/async/crypto_onwire.h
++++ b/src/msg/async/crypto_onwire.h
+@@ -45,6 +45,11 @@ struct MsgAuthError : public std::runtime_error {
+   }
+ };
+ 
++struct TxHandlerError : public std::runtime_error {
++  TxHandlerError(const char* what)
++    : std::runtime_error(std::string("tx handler error: ") + what) {}
++};
++
+ struct TxHandler {
+   virtual ~TxHandler() = default;
+ 
+-- 
+2.20.1
+
diff --git a/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch b/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch
new file mode 100644
index 0000000..ad8a205
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch
@@ -0,0 +1,61 @@
+From dfd1d81cec62e21e21696dc87d4db5f920e51a67 Mon Sep 17 00:00:00 2001
+From: Ilya Dryomov <idryomov@gmail.com>
+Date: Fri, 6 Mar 2020 20:16:45 +0100
+Subject: [PATCH] msg/async/crypto_onwire: fix endianness of nonce_t
+
+As a AES-GCM IV, nonce_t is implicitly shared between server and
+client.  Currently, if their endianness doesn't match, they are unable
+to communicate in secure mode because each gets its own idea of what
+the next nonce should be after the counter is incremented.
+
+Several RFCs state that the nonce counter should be BE, but since we
+use LE for everything on-disk and on-wire, make it LE.
+
+Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
+Reviewed-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
+Reviewed-by: Sage Weil <sage@redhat.com>
+
+CVE: CVE-2020-1759
+Upstream Status: Backport [dfd1d81cec62e21e21696dc87d4db5f920e51a67]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/msg/async/crypto_onwire.cc | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/msg/async/crypto_onwire.cc b/src/msg/async/crypto_onwire.cc
+index 07e7fe6553..c39632cbd6 100644
+--- a/src/msg/async/crypto_onwire.cc
++++ b/src/msg/async/crypto_onwire.cc
+@@ -20,8 +20,8 @@ static constexpr const std::size_t AESGCM_TAG_LEN{16};
+ static constexpr const std::size_t AESGCM_BLOCK_LEN{16};
+ 
+ struct nonce_t {
+-  std::uint32_t random_seq;
+-  std::uint64_t random_rest;
++  ceph_le32 random_seq;
++  ceph_le64 random_rest;
+ 
+   bool operator==(const nonce_t& rhs) const {
+     return !memcmp(this, &rhs, sizeof(*this));
+@@ -99,7 +99,7 @@ void AES128GCM_OnWireTxHandler::reset_tx_handler(
+   buffer.reserve(std::accumulate(std::begin(update_size_sequence),
+     std::end(update_size_sequence), AESGCM_TAG_LEN));
+ 
+-  ++nonce.random_seq;
++  nonce.random_seq = nonce.random_seq + 1;
+ }
+ 
+ void AES128GCM_OnWireTxHandler::authenticated_encrypt_update(
+@@ -204,7 +204,7 @@ void AES128GCM_OnWireRxHandler::reset_rx_handler()
+ 	reinterpret_cast<const unsigned char*>(&nonce))) {
+     throw std::runtime_error("EVP_DecryptInit_ex failed");
+   }
+-  ++nonce.random_seq;
++  nonce.random_seq = nonce.random_seq + 1;
+ }
+ 
+ ceph::bufferlist AES128GCM_OnWireRxHandler::authenticated_decrypt_update(
+-- 
+2.20.1
+
diff --git a/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch b/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch
new file mode 100644
index 0000000..30906d7
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch
@@ -0,0 +1,33 @@
+From 92da834cababc4dddd5dbbab5837310478d1e6d4 Mon Sep 17 00:00:00 2001
+From: Abhishek Lekshmanan <abhishek@suse.com>
+Date: Fri, 27 Mar 2020 19:29:01 +0100
+Subject: [PATCH] rgw: EPERM to ERR_INVALID_REQUEST
+
+As per Robin's comments and S3 spec
+
+Signed-off-by: Abhishek Lekshmanan <abhishek@suse.com>
+
+CVE: CVE-2020-1760
+Upstream Status: Backport [92da834cababc4dddd5dbbab5837310478d1e6d4]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/rgw/rgw_rest_s3.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
+index 1bfc8312de..f13ae23dd6 100644
+--- a/src/rgw/rgw_rest_s3.cc
++++ b/src/rgw/rgw_rest_s3.cc
+@@ -301,7 +301,7 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
+ 	/* reject unauthenticated response header manipulation, see
+ 	 * https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html */
+ 	if (s->auth.identity->is_anonymous()) {
+-	  return -EPERM;
++	  return -ERR_INVALID_REQUEST;
+ 	}
+ 	if (strcmp(p->param, "response-content-type") != 0) {
+ 	  response_attrs[p->http_attr] = val;
+-- 
+2.20.1
+
diff --git a/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch b/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch
new file mode 100644
index 0000000..af0fc79
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch
@@ -0,0 +1,64 @@
+From be7679007c3dfab3e19c22c38c36ccac91828e3b Mon Sep 17 00:00:00 2001
+From: "Robin H. Johnson" <rjohnson@digitalocean.com>
+Date: Fri, 27 Mar 2020 20:48:13 +0100
+Subject: [PATCH] rgw: reject control characters in response-header actions
+
+S3 GetObject permits overriding response header values, but those inputs
+need to be validated to insure only characters that are valid in an HTTP
+header value are present.
+
+Credit: Initial vulnerability discovery by William Bowling (@wcbowling)
+Credit: Further vulnerability discovery by Robin H. Johnson <rjohnson@digitalocean.com>
+Signed-off-by: Robin H. Johnson <rjohnson@digitalocean.com>
+
+CVE: CVE-2020-1760
+Upstream Status: Backport [be7679007c3dfab3e19c22c38c36ccac91828e3b]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/rgw/rgw_rest_s3.cc | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
+index f13ae23dd6..0de040968c 100644
+--- a/src/rgw/rgw_rest_s3.cc
++++ b/src/rgw/rgw_rest_s3.cc
+@@ -189,6 +189,15 @@ int decode_attr_bl_single_value(map<string, bufferlist>& attrs, const char *attr
+   return 0;
+ }
+ 
++inline bool str_has_cntrl(const std::string s) {
++  return std::any_of(s.begin(), s.end(), ::iscntrl);
++}
++
++inline bool str_has_cntrl(const char* s) {
++  std::string _s(s);
++  return str_has_cntrl(_s);
++}
++
+ int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
+ 					      off_t bl_len)
+ {
+@@ -303,6 +312,19 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
+ 	if (s->auth.identity->is_anonymous()) {
+ 	  return -ERR_INVALID_REQUEST;
+ 	}
++        /* HTTP specification says no control characters should be present in
++         * header values: https://tools.ietf.org/html/rfc7230#section-3.2
++         *      field-vchar    = VCHAR / obs-text
++         *
++         * Failure to validate this permits a CRLF injection in HTTP headers,
++         * whereas S3 GetObject only permits specific headers.
++         */
++        if(str_has_cntrl(val)) {
++          /* TODO: return a more distinct error in future;
++           * stating what the problem is */
++          return -ERR_INVALID_REQUEST;
++        }
++
+ 	if (strcmp(p->param, "response-content-type") != 0) {
+ 	  response_attrs[p->http_attr] = val;
+ 	} else {
+-- 
+2.20.1
+
diff --git a/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch b/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch
new file mode 100644
index 0000000..ae24147
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch
@@ -0,0 +1,36 @@
+From 8f90658c731499722d5f4393c8ad70b971d05f77 Mon Sep 17 00:00:00 2001
+From: Matt Benjamin <mbenjamin@redhat.com>
+Date: Fri, 27 Mar 2020 18:13:48 +0100
+Subject: [PATCH] rgw: reject unauthenticated response-header actions
+
+Signed-off-by: Matt Benjamin <mbenjamin@redhat.com>
+Reviewed-by: Casey Bodley <cbodley@redhat.com>
+(cherry picked from commit d8dd5e513c0c62bbd7d3044d7e2eddcd897bd400)
+
+CVE: CVE-2020-1760
+Upstream Status: Backport [8f90658c731499722d5f4393c8ad70b971d05f77]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/rgw/rgw_rest_s3.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
+index 532d738b58..1bfc8312de 100644
+--- a/src/rgw/rgw_rest_s3.cc
++++ b/src/rgw/rgw_rest_s3.cc
+@@ -298,6 +298,11 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
+       bool exists;
+       string val = s->info.args.get(p->param, &exists);
+       if (exists) {
++	/* reject unauthenticated response header manipulation, see
++	 * https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html */
++	if (s->auth.identity->is_anonymous()) {
++	  return -EPERM;
++	}
+ 	if (strcmp(p->param, "response-content-type") != 0) {
+ 	  response_attrs[p->http_attr] = val;
+ 	} else {
+-- 
+2.20.1
+
diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
index 8ab58eb..e41aa2f 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.0.bb
@@ -12,6 +12,11 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
+           file://0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch \
+           file://0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch \
+           file://0001-rgw-reject-unauthenticated-response-header-actions.patch \
+           file://0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch \
+           file://0001-rgw-reject-control-characters-in-response-header-act.patch \
 "
 
 SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
-- 
2.24.1


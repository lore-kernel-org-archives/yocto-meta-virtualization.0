Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.7830.1609214086428288384
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Dec 2020 19:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gjqUWTgs;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id y15so8263960qtv.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Dec 2020 19:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/OPg0rxK+b2x2ubFonUMJZtBI+7MAxgB07lFveOxenk=;
        b=gjqUWTgsi+87t0ez/ctO+UFjaHYjluJsm4jXWl44prBJKJCaLIh2L8Sy7/6ZHbEW9p
         5DJHB3UmOjXtgB/t/ZODmgMvR1gC7n6k+6TShqbSTSEQxvtNJxErLGsQrrJb8f/ey1BO
         D434if1bAb7pYMwP1E3EX6RX08kipJVHDvx5nBP95ueMbVGIZ7ugynHExFm4wGPFshM8
         7YPNXIqVTOBJSV3Lv4uPXNnA6ARZf8wAfF8LrYrQUPIaOn82pcw1lNaiGER3aqI+NwlX
         Tcwdz4RlcwFm7z0bSMZjII0xMH41uqWhU8O4cDr2vFlNkl4EnXWQQkzq7u/1KXZcnFqe
         Gt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/OPg0rxK+b2x2ubFonUMJZtBI+7MAxgB07lFveOxenk=;
        b=sRXGmfgAioe4zlZfY/lJwm85pSJOMaAQFbWKaGXAN6DwzgKAQJFKuRIDoY3nmN2x7L
         6BpHcP8D0CVqM3vG9y/nj6GQz4Y/yCg6QE3ab5YTh3YMAUq2+Sgrw9YJh+zS5UXGzUUZ
         njY3+7OHlXEoGLJwJTSKHMHnFdJyxHHjSJJvF+RhcEUfStgco2InTcOWusA2c6N/llvR
         uuh8MFmkoWnfYq6NPEOSA0uJptC2SVfq18qfH1COeZddAxTRrZvKC+xVecHBRJZNow9Z
         XyNLJi2KOEX43RLkTEKfqm4B83jZZKw00I6jLqjHf0w2b3cfNiKaCV9ho8dRlSOVyzcp
         nDmg==
X-Gm-Message-State: AOAM531k1kiu3URsItWtZTyol2p6CGl+M+h8bjlAduYttWKXOKv4gHRk
	BpxtB0nErfQm3qANo5rRumY=
X-Google-Smtp-Source: ABdhPJz4yF97WZacTDfu80xRE4e4sWDT6r6zkhpW16euBFMA6aFwYkgaAXQ4FhixUbsjBd/OBFZyuA==
X-Received: by 2002:ac8:6e83:: with SMTP id c3mr47070709qtv.318.1609214085275;
        Mon, 28 Dec 2020 19:54:45 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j203sm24684273qke.134.2020.12.28.19.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 19:54:44 -0800 (PST)
Date: Mon, 28 Dec 2020 22:54:42 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] ceph: uprev v15.2.0 -> v15.2.8
Message-ID: <20201229035441.GB14464@gmail.com>
References: <20201223203916.21407-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20201223203916.21407-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] ceph: uprev v15.2.0 -> v15.2.8
on 23/12/2020 sakib.sajal@windriver.com wrote:

> Removed patches that are contained in newer version.
> Contains fixes to CVES:
> CVE-2020-27781
> CVE 2020-25660
> CVE-2020-10753
> CVE-2020-10736
> CVE-2020-1759
> CVE-2020-1760
> 
> Built and run tested.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...l-caps-for-pre-octopus-tell-commands.patch | 100 -------
>  ...olV2-avoid-AES-GCM-nonce-reuse-vulne.patch | 256 ------------------
>  ...pto_onwire-fix-endianness-of-nonce_t.patch |  61 -----
>  ...001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch |  33 ---
>  ...ol-characters-in-response-header-act.patch |  64 -----
>  ...uthenticated-response-header-actions.patch |  36 ---
>  ...-for-pre-octopus-client-tell-command.patch |  95 -------
>  ...ReleaseNotes-note-about-security-fix.patch |  31 ---
>  .../ceph/{ceph_15.2.0.bb => ceph_15.2.8.bb}   |  18 +-
>  9 files changed, 5 insertions(+), 689 deletions(-)
>  delete mode 100644 recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch
>  rename recipes-extended/ceph/{ceph_15.2.0.bb => ceph_15.2.8.bb} (81%)
> 
> diff --git a/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch b/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch
> deleted file mode 100644
> index de191bf8..00000000
> --- a/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -From de67c1dab5597c91538970421b25f6ec667af492 Mon Sep 17 00:00:00 2001
> -From: Josh Durgin <jdurgin@redhat.com>
> -Date: Mon, 4 May 2020 17:03:35 -0400
> -Subject: [PATCH 1/3] mgr: require all caps for pre-octopus tell commands
> -
> -This matches the requirements for admin socket commands
> -sent via tell elsewhere.
> -
> -Signed-off-by: Josh Durgin <jdurgin@redhat.com>
> -
> -Upstream-status: Backport
> -[https://github.com/ceph/ceph/commit/347003e13167c428187a5450517850f4d85e09ad]
> -
> -Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ----
> - src/mgr/DaemonServer.cc | 37 ++++++++++++++++++++++---------------
> - 1 file changed, 22 insertions(+), 15 deletions(-)
> -
> -diff --git a/src/mgr/DaemonServer.cc b/src/mgr/DaemonServer.cc
> -index becd428a..527326e3 100644
> ---- a/src/mgr/DaemonServer.cc
> -+++ b/src/mgr/DaemonServer.cc
> -@@ -808,20 +808,12 @@ public:
> - bool DaemonServer::handle_command(const ref_t<MCommand>& m)
> - {
> -   std::lock_guard l(lock);
> --  // a blank fsid in MCommand signals a legacy client sending a "mon-mgr" CLI
> --  // command.
> --  if (m->fsid != uuid_d()) {
> --    cct->get_admin_socket()->queue_tell_command(m);
> -+  auto cmdctx = std::make_shared<CommandContext>(m);
> -+  try {
> -+    return _handle_command(cmdctx);
> -+  } catch (const bad_cmd_get& e) {
> -+    cmdctx->reply(-EINVAL, e.what());
> -     return true;
> --  } else {
> --    // legacy client; send to CLI processing
> --    auto cmdctx = std::make_shared<CommandContext>(m);
> --    try {
> --      return _handle_command(cmdctx);
> --    } catch (const bad_cmd_get& e) {
> --      cmdctx->reply(-EINVAL, e.what());
> --      return true;
> --    }
> -   }
> - }
> - 
> -@@ -853,8 +845,12 @@ bool DaemonServer::_handle_command(
> -   std::shared_ptr<CommandContext>& cmdctx)
> - {
> -   MessageRef m;
> -+  bool admin_socket_cmd = false;
> -   if (cmdctx->m_tell) {
> -     m = cmdctx->m_tell;
> -+    // a blank fsid in MCommand signals a legacy client sending a "mon-mgr" CLI
> -+    // command.
> -+    admin_socket_cmd = (cmdctx->m_tell->fsid != uuid_d());
> -   } else {
> -     m = cmdctx->m_mgr;
> -   }
> -@@ -888,7 +884,10 @@ bool DaemonServer::_handle_command(
> - 
> -   dout(10) << "decoded-size=" << cmdctx->cmdmap.size() << " prefix=" << prefix  << dendl;
> - 
> --  if (prefix == "get_command_descriptions") {
> -+  // this is just for mgr commands - admin socket commands will fall
> -+  // through and use the admin socket version of
> -+  // get_command_descriptions
> -+  if (prefix == "get_command_descriptions" && !admin_socket_cmd) {
> -     dout(10) << "reading commands from python modules" << dendl;
> -     const auto py_commands = py_modules.get_commands();
> - 
> -@@ -925,7 +924,10 @@ bool DaemonServer::_handle_command(
> - 
> -   bool is_allowed = false;
> -   ModuleCommand py_command;
> --  if (!mgr_cmd) {
> -+  if (admin_socket_cmd) {
> -+    // admin socket commands require all capabilities
> -+    is_allowed = session->caps.is_allow_all();
> -+  } else if (!mgr_cmd) {
> -     // Resolve the command to the name of the module that will
> -     // handle it (if the command exists)
> -     auto py_commands = py_modules.get_py_commands();
> -@@ -958,6 +960,11 @@ bool DaemonServer::_handle_command(
> -     << "entity='" << session->entity_name << "' "
> -     << "cmd=" << cmdctx->cmd << ": dispatch";
> - 
> -+  if (admin_socket_cmd) {
> -+    cct->get_admin_socket()->queue_tell_command(cmdctx->m_tell);
> -+    return true;
> -+  }
> -+
> -   // ----------------
> -   // service map commands
> -   if (prefix == "service dump") {
> --- 
> -2.25.1
> -
> diff --git a/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch b/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch
> deleted file mode 100644
> index 54156698..00000000
> --- a/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch
> +++ /dev/null
> @@ -1,256 +0,0 @@
> -From 20b7bb685c5ea74c651ca1ea547ac66b0fee7035 Mon Sep 17 00:00:00 2001
> -From: Ilya Dryomov <idryomov@gmail.com>
> -Date: Fri, 6 Mar 2020 20:16:45 +0100
> -Subject: [PATCH] msg/async/ProtocolV2: avoid AES-GCM nonce reuse
> - vulnerabilities
> -
> -The secure mode uses AES-128-GCM with 96-bit nonces consisting of a
> -32-bit counter followed by a 64-bit salt.  The counter is incremented
> -after processing each frame, the salt is fixed for the duration of
> -the session.  Both are initialized from the session key generated
> -during session negotiation, so the counter starts with essentially
> -a random value.  It is allowed to wrap, and, after 2**32 frames, it
> -repeats, resulting in nonce reuse (the actual sequence numbers that
> -the messenger works with are 64-bit, so the session continues on).
> -
> -Because of how GCM works, this completely breaks both confidentiality
> -and integrity aspects of the secure mode.  A single nonce reuse reveals
> -the XOR of two plaintexts and almost completely reveals the subkey
> -used for producing authentication tags.  After a few nonces get used
> -twice, all confidentiality and integrity goes out the window and the
> -attacker can potentially encrypt-authenticate plaintext of their
> -choice.
> -
> -We can't easily change the nonce format to extend the counter to
> -64 bits (and possibly XOR it with a longer salt).  Instead, just
> -remember the initial nonce and cut the session before it repeats,
> -forcing renegotiation.
> -
> -Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
> -Reviewed-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
> -Reviewed-by: Sage Weil <sage@redhat.com>
> -
> -Conflicts:
> -	src/msg/async/ProtocolV2.h [ context: commit ed3ec4c01d17
> -	  ("msg: Build target 'common' without using namespace in
> -	  headers") not in octopus ]
> -
> -CVE: CVE-2020-1759
> -Upstream Status: Backport [20b7bb685c5ea74c651ca1ea547ac66b0fee7035]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/msg/async/ProtocolV2.cc    | 62 ++++++++++++++++++++++++----------
> - src/msg/async/ProtocolV2.h     |  5 +--
> - src/msg/async/crypto_onwire.cc | 17 ++++++++--
> - src/msg/async/crypto_onwire.h  |  5 +++
> - 4 files changed, 67 insertions(+), 22 deletions(-)
> -
> -diff --git a/src/msg/async/ProtocolV2.cc b/src/msg/async/ProtocolV2.cc
> -index 8fc02db6e5..c69f2ccf79 100644
> ---- a/src/msg/async/ProtocolV2.cc
> -+++ b/src/msg/async/ProtocolV2.cc
> -@@ -533,7 +533,10 @@ ssize_t ProtocolV2::write_message(Message *m, bool more) {
> - 			     m->get_payload(),
> - 			     m->get_middle(),
> - 			     m->get_data());
> --  connection->outgoing_bl.append(message.get_buffer(session_stream_handlers));
> -+  if (!append_frame(message)) {
> -+    m->put();
> -+    return -EILSEQ;
> -+  }
> - 
> -   ldout(cct, 5) << __func__ << " sending message m=" << m
> -                 << " seq=" << m->get_seq() << " " << *m << dendl;
> -@@ -566,15 +569,17 @@ ssize_t ProtocolV2::write_message(Message *m, bool more) {
> -   return rc;
> - }
> - 
> --void ProtocolV2::append_keepalive() {
> --  ldout(cct, 10) << __func__ << dendl;
> --  auto keepalive_frame = KeepAliveFrame::Encode();
> --  connection->outgoing_bl.append(keepalive_frame.get_buffer(session_stream_handlers));
> --}
> --
> --void ProtocolV2::append_keepalive_ack(utime_t &timestamp) {
> --  auto keepalive_ack_frame = KeepAliveFrameAck::Encode(timestamp);
> --  connection->outgoing_bl.append(keepalive_ack_frame.get_buffer(session_stream_handlers));
> -+template <class F>
> -+bool ProtocolV2::append_frame(F& frame) {
> -+  ceph::bufferlist bl;
> -+  try {
> -+    bl = frame.get_buffer(session_stream_handlers);
> -+  } catch (ceph::crypto::onwire::TxHandlerError &e) {
> -+    ldout(cct, 1) << __func__ << " " << e.what() << dendl;
> -+    return false;
> -+  }
> -+  connection->outgoing_bl.append(bl);
> -+  return true;
> - }
> - 
> - void ProtocolV2::handle_message_ack(uint64_t seq) {
> -@@ -612,7 +617,15 @@ void ProtocolV2::write_event() {
> -   connection->write_lock.lock();
> -   if (can_write) {
> -     if (keepalive) {
> --      append_keepalive();
> -+      ldout(cct, 10) << __func__ << " appending keepalive" << dendl;
> -+      auto keepalive_frame = KeepAliveFrame::Encode();
> -+      if (!append_frame(keepalive_frame)) {
> -+        connection->write_lock.unlock();
> -+        connection->lock.lock();
> -+        fault();
> -+        connection->lock.unlock();
> -+        return;
> -+      }
> -       keepalive = false;
> -     }
> - 
> -@@ -663,13 +676,16 @@ void ProtocolV2::write_event() {
> -     if (r == 0) {
> -       uint64_t left = ack_left;
> -       if (left) {
> --        auto ack = AckFrame::Encode(in_seq);
> --        connection->outgoing_bl.append(ack.get_buffer(session_stream_handlers));
> -         ldout(cct, 10) << __func__ << " try send msg ack, acked " << left
> -                        << " messages" << dendl;
> --        ack_left -= left;
> --        left = ack_left;
> --        r = connection->_try_send(left);
> -+        auto ack_frame = AckFrame::Encode(in_seq);
> -+        if (append_frame(ack_frame)) {
> -+          ack_left -= left;
> -+          left = ack_left;
> -+          r = connection->_try_send(left);
> -+        } else {
> -+          r = -EILSEQ;
> -+        }
> -       } else if (is_queued()) {
> -         r = connection->_try_send();
> -       }
> -@@ -769,7 +785,13 @@ template <class F>
> - CtPtr ProtocolV2::write(const std::string &desc,
> -                         CONTINUATION_TYPE<ProtocolV2> &next,
> -                         F &frame) {
> --  ceph::bufferlist bl = frame.get_buffer(session_stream_handlers);
> -+  ceph::bufferlist bl;
> -+  try {
> -+    bl = frame.get_buffer(session_stream_handlers);
> -+  } catch (ceph::crypto::onwire::TxHandlerError &e) {
> -+    ldout(cct, 1) << __func__ << " " << e.what() << dendl;
> -+    return _fault();
> -+  }
> -   return write(desc, next, bl);
> - }
> - 
> -@@ -1672,7 +1694,11 @@ CtPtr ProtocolV2::handle_keepalive2(ceph::bufferlist &payload)
> -   ldout(cct, 30) << __func__ << " got KEEPALIVE2 tag ..." << dendl;
> - 
> -   connection->write_lock.lock();
> --  append_keepalive_ack(keepalive_frame.timestamp());
> -+  auto keepalive_ack_frame = KeepAliveFrameAck::Encode(keepalive_frame.timestamp());
> -+  if (!append_frame(keepalive_ack_frame)) {
> -+    connection->write_lock.unlock();
> -+    return _fault();
> -+  }
> -   connection->write_lock.unlock();
> - 
> -   ldout(cct, 20) << __func__ << " got KEEPALIVE2 "
> -diff --git a/src/msg/async/ProtocolV2.h b/src/msg/async/ProtocolV2.h
> -index 2dbe647ae5..9897d18cf2 100644
> ---- a/src/msg/async/ProtocolV2.h
> -+++ b/src/msg/async/ProtocolV2.h
> -@@ -129,6 +129,9 @@ private:
> -                         CONTINUATION_TYPE<ProtocolV2> &next,
> -                         bufferlist &buffer);
> - 
> -+  template <class F>
> -+  bool append_frame(F& frame);
> -+
> -   void requeue_sent();
> -   uint64_t discard_requeued_up_to(uint64_t out_seq, uint64_t seq);
> -   void reset_recv_state();
> -@@ -140,8 +143,6 @@ private:
> -   void prepare_send_message(uint64_t features, Message *m);
> -   out_queue_entry_t _get_next_outgoing();
> -   ssize_t write_message(Message *m, bool more);
> --  void append_keepalive();
> --  void append_keepalive_ack(utime_t &timestamp);
> -   void handle_message_ack(uint64_t seq);
> - 
> -   CONTINUATION_DECL(ProtocolV2, _wait_for_peer_banner);
> -diff --git a/src/msg/async/crypto_onwire.cc b/src/msg/async/crypto_onwire.cc
> -index acf3f66689..07e7fe6553 100644
> ---- a/src/msg/async/crypto_onwire.cc
> -+++ b/src/msg/async/crypto_onwire.cc
> -@@ -22,6 +22,10 @@ static constexpr const std::size_t AESGCM_BLOCK_LEN{16};
> - struct nonce_t {
> -   std::uint32_t random_seq;
> -   std::uint64_t random_rest;
> -+
> -+  bool operator==(const nonce_t& rhs) const {
> -+    return !memcmp(this, &rhs, sizeof(*this));
> -+  }
> - } __attribute__((packed));
> - static_assert(sizeof(nonce_t) == AESGCM_IV_LEN);
> - 
> -@@ -35,7 +39,8 @@ class AES128GCM_OnWireTxHandler : public ceph::crypto::onwire::TxHandler {
> -   CephContext* const cct;
> -   std::unique_ptr<EVP_CIPHER_CTX, decltype(&::EVP_CIPHER_CTX_free)> ectx;
> -   ceph::bufferlist buffer;
> --  nonce_t nonce;
> -+  nonce_t nonce, initial_nonce;
> -+  bool used_initial_nonce;
> -   static_assert(sizeof(nonce) == AESGCM_IV_LEN);
> - 
> - public:
> -@@ -44,7 +49,7 @@ public:
> - 			    const nonce_t& nonce)
> -     : cct(cct),
> -       ectx(EVP_CIPHER_CTX_new(), EVP_CIPHER_CTX_free),
> --      nonce(nonce) {
> -+      nonce(nonce), initial_nonce(nonce), used_initial_nonce(false) {
> -     ceph_assert_always(ectx);
> -     ceph_assert_always(key.size() * CHAR_BIT == 128);
> - 
> -@@ -61,6 +66,7 @@ public:
> - 
> -   ~AES128GCM_OnWireTxHandler() override {
> -     ::ceph::crypto::zeroize_for_security(&nonce, sizeof(nonce));
> -+    ::ceph::crypto::zeroize_for_security(&initial_nonce, sizeof(initial_nonce));
> -   }
> - 
> -   std::uint32_t calculate_segment_size(std::uint32_t size) override
> -@@ -78,6 +84,13 @@ public:
> - void AES128GCM_OnWireTxHandler::reset_tx_handler(
> -   std::initializer_list<std::uint32_t> update_size_sequence)
> - {
> -+  if (nonce == initial_nonce) {
> -+    if (used_initial_nonce) {
> -+      throw ceph::crypto::onwire::TxHandlerError("out of nonces");
> -+    }
> -+    used_initial_nonce = true;
> -+  }
> -+
> -   if(1 != EVP_EncryptInit_ex(ectx.get(), nullptr, nullptr, nullptr,
> -       reinterpret_cast<const unsigned char*>(&nonce))) {
> -     throw std::runtime_error("EVP_EncryptInit_ex failed");
> -diff --git a/src/msg/async/crypto_onwire.h b/src/msg/async/crypto_onwire.h
> -index bd682e8c71..0c544f205a 100644
> ---- a/src/msg/async/crypto_onwire.h
> -+++ b/src/msg/async/crypto_onwire.h
> -@@ -45,6 +45,11 @@ struct MsgAuthError : public std::runtime_error {
> -   }
> - };
> - 
> -+struct TxHandlerError : public std::runtime_error {
> -+  TxHandlerError(const char* what)
> -+    : std::runtime_error(std::string("tx handler error: ") + what) {}
> -+};
> -+
> - struct TxHandler {
> -   virtual ~TxHandler() = default;
> - 
> --- 
> -2.20.1
> -
> diff --git a/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch b/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch
> deleted file mode 100644
> index ad8a2055..00000000
> --- a/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From dfd1d81cec62e21e21696dc87d4db5f920e51a67 Mon Sep 17 00:00:00 2001
> -From: Ilya Dryomov <idryomov@gmail.com>
> -Date: Fri, 6 Mar 2020 20:16:45 +0100
> -Subject: [PATCH] msg/async/crypto_onwire: fix endianness of nonce_t
> -
> -As a AES-GCM IV, nonce_t is implicitly shared between server and
> -client.  Currently, if their endianness doesn't match, they are unable
> -to communicate in secure mode because each gets its own idea of what
> -the next nonce should be after the counter is incremented.
> -
> -Several RFCs state that the nonce counter should be BE, but since we
> -use LE for everything on-disk and on-wire, make it LE.
> -
> -Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
> -Reviewed-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
> -Reviewed-by: Sage Weil <sage@redhat.com>
> -
> -CVE: CVE-2020-1759
> -Upstream Status: Backport [dfd1d81cec62e21e21696dc87d4db5f920e51a67]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/msg/async/crypto_onwire.cc | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/msg/async/crypto_onwire.cc b/src/msg/async/crypto_onwire.cc
> -index 07e7fe6553..c39632cbd6 100644
> ---- a/src/msg/async/crypto_onwire.cc
> -+++ b/src/msg/async/crypto_onwire.cc
> -@@ -20,8 +20,8 @@ static constexpr const std::size_t AESGCM_TAG_LEN{16};
> - static constexpr const std::size_t AESGCM_BLOCK_LEN{16};
> - 
> - struct nonce_t {
> --  std::uint32_t random_seq;
> --  std::uint64_t random_rest;
> -+  ceph_le32 random_seq;
> -+  ceph_le64 random_rest;
> - 
> -   bool operator==(const nonce_t& rhs) const {
> -     return !memcmp(this, &rhs, sizeof(*this));
> -@@ -99,7 +99,7 @@ void AES128GCM_OnWireTxHandler::reset_tx_handler(
> -   buffer.reserve(std::accumulate(std::begin(update_size_sequence),
> -     std::end(update_size_sequence), AESGCM_TAG_LEN));
> - 
> --  ++nonce.random_seq;
> -+  nonce.random_seq = nonce.random_seq + 1;
> - }
> - 
> - void AES128GCM_OnWireTxHandler::authenticated_encrypt_update(
> -@@ -204,7 +204,7 @@ void AES128GCM_OnWireRxHandler::reset_rx_handler()
> - 	reinterpret_cast<const unsigned char*>(&nonce))) {
> -     throw std::runtime_error("EVP_DecryptInit_ex failed");
> -   }
> --  ++nonce.random_seq;
> -+  nonce.random_seq = nonce.random_seq + 1;
> - }
> - 
> - ceph::bufferlist AES128GCM_OnWireRxHandler::authenticated_decrypt_update(
> --- 
> -2.20.1
> -
> diff --git a/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch b/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch
> deleted file mode 100644
> index 30906d7c..00000000
> --- a/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 92da834cababc4dddd5dbbab5837310478d1e6d4 Mon Sep 17 00:00:00 2001
> -From: Abhishek Lekshmanan <abhishek@suse.com>
> -Date: Fri, 27 Mar 2020 19:29:01 +0100
> -Subject: [PATCH] rgw: EPERM to ERR_INVALID_REQUEST
> -
> -As per Robin's comments and S3 spec
> -
> -Signed-off-by: Abhishek Lekshmanan <abhishek@suse.com>
> -
> -CVE: CVE-2020-1760
> -Upstream Status: Backport [92da834cababc4dddd5dbbab5837310478d1e6d4]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/rgw/rgw_rest_s3.cc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
> -index 1bfc8312de..f13ae23dd6 100644
> ---- a/src/rgw/rgw_rest_s3.cc
> -+++ b/src/rgw/rgw_rest_s3.cc
> -@@ -301,7 +301,7 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
> - 	/* reject unauthenticated response header manipulation, see
> - 	 * https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html */
> - 	if (s->auth.identity->is_anonymous()) {
> --	  return -EPERM;
> -+	  return -ERR_INVALID_REQUEST;
> - 	}
> - 	if (strcmp(p->param, "response-content-type") != 0) {
> - 	  response_attrs[p->http_attr] = val;
> --- 
> -2.20.1
> -
> diff --git a/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch b/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch
> deleted file mode 100644
> index af0fc79a..00000000
> --- a/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-response-header-act.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From be7679007c3dfab3e19c22c38c36ccac91828e3b Mon Sep 17 00:00:00 2001
> -From: "Robin H. Johnson" <rjohnson@digitalocean.com>
> -Date: Fri, 27 Mar 2020 20:48:13 +0100
> -Subject: [PATCH] rgw: reject control characters in response-header actions
> -
> -S3 GetObject permits overriding response header values, but those inputs
> -need to be validated to insure only characters that are valid in an HTTP
> -header value are present.
> -
> -Credit: Initial vulnerability discovery by William Bowling (@wcbowling)
> -Credit: Further vulnerability discovery by Robin H. Johnson <rjohnson@digitalocean.com>
> -Signed-off-by: Robin H. Johnson <rjohnson@digitalocean.com>
> -
> -CVE: CVE-2020-1760
> -Upstream Status: Backport [be7679007c3dfab3e19c22c38c36ccac91828e3b]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/rgw/rgw_rest_s3.cc | 22 ++++++++++++++++++++++
> - 1 file changed, 22 insertions(+)
> -
> -diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
> -index f13ae23dd6..0de040968c 100644
> ---- a/src/rgw/rgw_rest_s3.cc
> -+++ b/src/rgw/rgw_rest_s3.cc
> -@@ -189,6 +189,15 @@ int decode_attr_bl_single_value(map<string, bufferlist>& attrs, const char *attr
> -   return 0;
> - }
> - 
> -+inline bool str_has_cntrl(const std::string s) {
> -+  return std::any_of(s.begin(), s.end(), ::iscntrl);
> -+}
> -+
> -+inline bool str_has_cntrl(const char* s) {
> -+  std::string _s(s);
> -+  return str_has_cntrl(_s);
> -+}
> -+
> - int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
> - 					      off_t bl_len)
> - {
> -@@ -303,6 +312,19 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
> - 	if (s->auth.identity->is_anonymous()) {
> - 	  return -ERR_INVALID_REQUEST;
> - 	}
> -+        /* HTTP specification says no control characters should be present in
> -+         * header values: https://tools.ietf.org/html/rfc7230#section-3.2
> -+         *      field-vchar    = VCHAR / obs-text
> -+         *
> -+         * Failure to validate this permits a CRLF injection in HTTP headers,
> -+         * whereas S3 GetObject only permits specific headers.
> -+         */
> -+        if(str_has_cntrl(val)) {
> -+          /* TODO: return a more distinct error in future;
> -+           * stating what the problem is */
> -+          return -ERR_INVALID_REQUEST;
> -+        }
> -+
> - 	if (strcmp(p->param, "response-content-type") != 0) {
> - 	  response_attrs[p->http_attr] = val;
> - 	} else {
> --- 
> -2.20.1
> -
> diff --git a/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch b/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch
> deleted file mode 100644
> index ae241473..00000000
> --- a/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-header-actions.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 8f90658c731499722d5f4393c8ad70b971d05f77 Mon Sep 17 00:00:00 2001
> -From: Matt Benjamin <mbenjamin@redhat.com>
> -Date: Fri, 27 Mar 2020 18:13:48 +0100
> -Subject: [PATCH] rgw: reject unauthenticated response-header actions
> -
> -Signed-off-by: Matt Benjamin <mbenjamin@redhat.com>
> -Reviewed-by: Casey Bodley <cbodley@redhat.com>
> -(cherry picked from commit d8dd5e513c0c62bbd7d3044d7e2eddcd897bd400)
> -
> -CVE: CVE-2020-1760
> -Upstream Status: Backport [8f90658c731499722d5f4393c8ad70b971d05f77]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/rgw/rgw_rest_s3.cc | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
> -index 532d738b58..1bfc8312de 100644
> ---- a/src/rgw/rgw_rest_s3.cc
> -+++ b/src/rgw/rgw_rest_s3.cc
> -@@ -298,6 +298,11 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_ofs,
> -       bool exists;
> -       string val = s->info.args.get(p->param, &exists);
> -       if (exists) {
> -+	/* reject unauthenticated response header manipulation, see
> -+	 * https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html */
> -+	if (s->auth.identity->is_anonymous()) {
> -+	  return -EPERM;
> -+	}
> - 	if (strcmp(p->param, "response-content-type") != 0) {
> - 	  response_attrs[p->http_attr] = val;
> - 	} else {
> --- 
> -2.20.1
> -
> diff --git a/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch b/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch
> deleted file mode 100644
> index 79f2174b..00000000
> --- a/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -From ddbac9b2779172876ebd2d26b68b04b02350a125 Mon Sep 17 00:00:00 2001
> -From: Josh Durgin <jdurgin@redhat.com>
> -Date: Thu, 23 Apr 2020 00:22:10 -0400
> -Subject: [PATCH 2/3] mon: enforce caps for pre-octopus client tell commands
> -
> -This affects only the commands whitelisted here - in particular
> -injectargs requires write access to the monitors.
> -
> -Signed-off-by: Josh Durgin <jdurgin@redhat.com>
> -
> -Upstream-status: Backport 
> -[https://github.com/ceph/ceph/commit/fc5e56b75a97c4652c87e9959aad1c4dec45010d]
> -
> -Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ----
> - src/mon/Monitor.cc | 56 +++++++++++++++++++++++-----------------------
> - 1 file changed, 28 insertions(+), 28 deletions(-)
> -
> -diff --git a/src/mon/Monitor.cc b/src/mon/Monitor.cc
> -index b7cb3eae..eecd2f68 100644
> ---- a/src/mon/Monitor.cc
> -+++ b/src/mon/Monitor.cc
> -@@ -3226,34 +3226,6 @@ void Monitor::handle_command(MonOpRequestRef op)
> -     return;
> -   }
> - 
> --  // compat kludge for legacy clients trying to tell commands that are
> --  // new.  see bottom of MonCommands.h.  we need to handle both (1)
> --  // pre-octopus clients and (2) octopus clients with a mix of pre-octopus
> --  // and octopus mons.
> --  if ((!HAVE_FEATURE(m->get_connection()->get_features(), SERVER_OCTOPUS) ||
> --       monmap->min_mon_release < ceph_release_t::octopus) &&
> --      (prefix == "injectargs" ||
> --       prefix == "smart" ||
> --       prefix == "mon_status" ||
> --       prefix == "heap")) {
> --    if (m->get_connection()->get_messenger() == 0) {
> --      // Prior to octopus, monitors might forward these messages
> --      // around. that was broken at baseline, and if we try to process
> --      // this message now, it will assert out when we try to send a
> --      // message in reply from the asok/tell worker (see
> --      // AnonConnection).  Just reply with an error.
> --      dout(5) << __func__ << " failing forwarded command from a (presumably) "
> --	      << "pre-octopus peer" << dendl;
> --      reply_command(
> --	op, -EBUSY,
> --	"failing forwarded tell command in mixed-version mon cluster", 0);
> --      return;
> --    }
> --    dout(5) << __func__ << " passing command to tell/asok" << dendl;
> --    cct->get_admin_socket()->queue_tell_command(m);
> --    return;
> --  }
> --
> -   string module;
> -   string err;
> - 
> -@@ -3368,6 +3340,34 @@ void Monitor::handle_command(MonOpRequestRef op)
> -       << "entity='" << session->entity_name << "' "
> -       << "cmd=" << m->cmd << ": dispatch";
> - 
> -+  // compat kludge for legacy clients trying to tell commands that are
> -+  // new.  see bottom of MonCommands.h.  we need to handle both (1)
> -+  // pre-octopus clients and (2) octopus clients with a mix of pre-octopus
> -+  // and octopus mons.
> -+  if ((!HAVE_FEATURE(m->get_connection()->get_features(), SERVER_OCTOPUS) ||
> -+       monmap->min_mon_release < ceph_release_t::octopus) &&
> -+      (prefix == "injectargs" ||
> -+       prefix == "smart" ||
> -+       prefix == "mon_status" ||
> -+       prefix == "heap")) {
> -+    if (m->get_connection()->get_messenger() == 0) {
> -+      // Prior to octopus, monitors might forward these messages
> -+      // around. that was broken at baseline, and if we try to process
> -+      // this message now, it will assert out when we try to send a
> -+      // message in reply from the asok/tell worker (see
> -+      // AnonConnection).  Just reply with an error.
> -+      dout(5) << __func__ << " failing forwarded command from a (presumably) "
> -+	      << "pre-octopus peer" << dendl;
> -+      reply_command(
> -+	op, -EBUSY,
> -+	"failing forwarded tell command in mixed-version mon cluster", 0);
> -+      return;
> -+    }
> -+    dout(5) << __func__ << " passing command to tell/asok" << dendl;
> -+    cct->get_admin_socket()->queue_tell_command(m);
> -+    return;
> -+  }
> -+
> -   if (mon_cmd->is_mgr()) {
> -     const auto& hdr = m->get_header();
> -     uint64_t size = hdr.front_len + hdr.middle_len + hdr.data_len;
> --- 
> -2.25.1
> -
> diff --git a/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch b/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch
> deleted file mode 100644
> index ed2a63e7..00000000
> --- a/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-security-fix.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 56800925651857821034ac9c8ec82d45635cc3b8 Mon Sep 17 00:00:00 2001
> -From: Josh Durgin <jdurgin@redhat.com>
> -Date: Wed, 13 May 2020 21:34:56 -0700
> -Subject: [PATCH 3/3] PendingReleaseNotes: note about security fix
> -
> -Signed-off-by: Josh Durgin <jdurgin@redhat.com>
> -
> -Upstream-status: Backport 
> -[https://github.com/ceph/ceph/commit/06f239fc35f35865d2cf92dda1ac8f4d5fe82bde]
> -
> -Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ----
> - PendingReleaseNotes | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/PendingReleaseNotes b/PendingReleaseNotes
> -index c9fd4c79..6e07ce6d 100644
> ---- a/PendingReleaseNotes
> -+++ b/PendingReleaseNotes
> -@@ -1,6 +1,8 @@
> - >=15.0.0
> - --------
> - 
> -+* CVE-2020-10736: Fixes an authorization bypass in monitor and manager daemons
> -+
> - * The RGW "num_rados_handles" has been removed.
> -   * If you were using a value of "num_rados_handles" greater than 1
> -     multiply your current "objecter_inflight_ops" and 
> --- 
> -2.25.1
> -
> diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.8.bb
> similarity index 81%
> rename from recipes-extended/ceph/ceph_15.2.0.bb
> rename to recipes-extended/ceph/ceph_15.2.8.bb
> index 8454a200..f771baa2 100644
> --- a/recipes-extended/ceph/ceph_15.2.0.bb
> +++ b/recipes-extended/ceph/ceph_15.2.8.bb
> @@ -12,23 +12,15 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>             file://0001-fix-host-library-paths-were-used.patch \
>             file://ceph.conf \
> -           file://0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch \
> -           file://0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.patch \
> -           file://0001-rgw-reject-unauthenticated-response-header-actions.patch \
> -           file://0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch \
> -           file://0001-rgw-reject-control-characters-in-response-header-act.patch \
> -           file://0001-mgr-require-all-caps-for-pre-octopus-tell-commands.patch \ 
> -           file://0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch \
> -           file://0003-PendingReleaseNotes-note-about-security-fix.patch \
>             file://0001-add-missing-include-for-atomic-bool.patch \
>             file://0001-cmake-add-support-for-python3.9.patch \
>  "
>  
> -SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
> -SRC_URI[sha256sum] = "4292c473d1714a6602c525d7582e4e03ec608f0a1cbc0dd338207e5c7068e0d3"
> -SRC_URI[sha1sum] = "7158806ece1483fcccdf1172c20cc34d9401c543"
> -SRC_URI[sha384sum] = "20e996dbf30d1e33a6d6aae36960190125ce263d306415bcec5d2b3032b8b8f730deeba3ca318576573127d08909404a"
> -SRC_URI[sha512sum] = "07a3ff2ccf1a3abac652ff8c5f1611e7c628fcedcb280adc6cd49792b46fa50c7c29437dc57c2c4a6af708a6833abf8c1a386ef2142d30bd5e1f214ba7aec4f2"
> +SRC_URI[md5sum] = "cab93dadfe38888561d390fd58b8c947"
> +SRC_URI[sha256sum] = "64c5eaf8c1e4092e59bc538e9241b6d5cf4ffca92563031abbea8b37b4cab9da"
> +SRC_URI[sha1sum] = "77b60c3775cd6e38f2d07870aee550368105c74b"
> +SRC_URI[sha384sum] = "2173c5176e9ff3745e4bc493585a8cf14e9e7737cf575551a010b7b84cd6b88b378dc93e6509b3a696732c51f530fa60"
> +SRC_URI[sha512sum] = "66c7322575165b4747955ac9de34f9f9e2d4361c8cd8498819383883045601b92f786c4336c79369d6f019db1c4524c492faa40cdceed7fc1b2b373ca6ab5065"
>  
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> -- 
> 2.29.2
> 

> 
> 
> 


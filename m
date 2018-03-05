Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 814D7E00CE2; Mon,  5 Mar 2018 07:37:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D5B5E0074C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Mar 2018 07:36:45 -0800 (PST)
Received: by mail-qt0-f195.google.com with SMTP id g60so20772652qtd.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Mar 2018 07:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=V6NxOEGlWJzrbWLZxTSAMPqWjGK4dlTVXKDY+ih2Nsk=;
	b=Drf78YVHBu37MMgnT814QPrLHGIb+Cse4kKmywsruuGjZZgtT8QV5ASUDmFtDLDRl9
	RmGsnOiv3AxrCMG4tbjF1wLCutd+LoKt+XWmPo8XTRn+7om8UnOzDpAP5oxdv2+ln48A
	qOX+oLGUr1IyzkUO5pOcW9DqMRCMVIRhYVhAL31B2UvzlrI8BpqO4mLZ4eqRvR71koDo
	xqygVfPiwYIYzkKDtTTTN0FU/yBw0sMDIMpsnbn7Wa1lhBtTPztxHKxN5WFj6HITgzt1
	ni+23tdwg0PfD2wxmVp3/Hzv5XL19lRUXc9c/XcslRbKOR5PytjAgvsU744AJoneJ6Ch
	Npjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=V6NxOEGlWJzrbWLZxTSAMPqWjGK4dlTVXKDY+ih2Nsk=;
	b=lsCfa9HWF9FR91uogxdVRKXzmr2RJHNaGL1PYTWYTezfOKxF3Cs2IBKwSrFA8JMuO0
	uYB59eCsxJqyaYj3o8+9E3hRecGYj4PacJV6jovnh3znXPqIluHY1f2p+V34F+OEg48h
	yXTEUzj0FVsoo18QBSoHHnPSCxM9Ype9YHbCHxXv5S1FnuBUfZZt6/1kDNxjOafTNE/Z
	s+2pOij9a0X99t2+MTdU6Yy+KkLqqDhcrcu0sKur9ODFB72SFENTaEcsUswwlq8SR7b0
	xmbMyaxYh34wLIvBsKyy/IXvJGFnc/fjHemLMcGp9+ULg3cX7Sy1LPQluUOLgEdHknH8
	ajhQ==
X-Gm-Message-State: AElRT7FuCWD/Ji7L0jH4I2fHv3RVYG6/oYK1rtpxFIkzRexhhtJW7kvL
	LGyc2hMd5hnkSsdppw+l21tpmYRJAiFsmMdr6+4gAv3euiUNymj1lT1lYF4FLfk3o8PViZ1aWZ2
	uqlj1ve3k5aTPaNQanveuVz3ebxrjXGJ5cw==
MIME-Version: 1.0
X-Google-Smtp-Source: AG47ELtZG5GR6YMSANkMveJ14A7XIKV9RQ/xdEnIcd3W3dYUHZUjV2DBzq27nA4VenLX9wpDbe2IeA==
X-Received: by 10.200.23.16 with SMTP id w16mr24550516qtj.131.1520264203984;
	Mon, 05 Mar 2018 07:36:43 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1126:b99c:ee44:103c])
	by smtp.gmail.com with ESMTPSA id
	n29sm9474962qtf.18.2018.03.05.07.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 07:36:43 -0800 (PST)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: kurt.bodiker@braintrust-us.com,
	meta-virtualization@yoctoproject.org
Date: Mon,  5 Mar 2018 10:35:06 -0500
Message-Id: <a624178531b4f1152540500ce206171ef0565500.1519915283.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
Subject: [PATCH 6/7] xen: TPM Emulator for Xen stubdoms
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 15:37:21 -0000
Content-Type: text/plain; charset="US-ASCII"

From: kebodiker <kurt.bodiker@braintrust-us.com>

TPM Emulator is a software-based TPM and MTM emulator. This TPM Emulator
recipe creates a static library that is cross-compiled against MiniOS,
Xen, LWIP, Newlib, PolarSSL, and the stubdom-specific GMP headers and
subsequently used during the cross-compilation and linking of the Xen
vTPM and vTPM Manager stubdomains.

The current Xen source code is hardcoded to fetch a specific version of
this package.  The patch files originate from the Xen/stubdom source
tree. This recipe provides the flexibility to change version or modify
the patches.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
 recipes-extended/xen/files/tpmemu-0.7.4.patch      |  12 ++
 recipes-extended/xen/files/vtpm-bufsize.patch      |  13 ++
 recipes-extended/xen/files/vtpm-cmake-Wextra.patch |  21 +++
 .../xen/files/vtpm-deepquote-anyloc.patch          | 127 +++++++++++++
 recipes-extended/xen/files/vtpm-deepquote.patch    | 187 ++++++++++++++++++++
 .../xen/files/vtpm-implicit-fallthrough.patch      |  10 ++
 recipes-extended/xen/files/vtpm-locality.patch     |  50 ++++++
 .../xen/files/vtpm-parent-sign-ek.patch            | 196 +++++++++++++++++++++
 recipes-extended/xen/tpm-emulator.inc              |  31 ++++
 recipes-extended/xen/tpm-emulator_0.7.4.bb         |  26 +++
 10 files changed, 673 insertions(+)
 create mode 100644 recipes-extended/xen/files/tpmemu-0.7.4.patch
 create mode 100644 recipes-extended/xen/files/vtpm-bufsize.patch
 create mode 100644 recipes-extended/xen/files/vtpm-cmake-Wextra.patch
 create mode 100644 recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
 create mode 100644 recipes-extended/xen/files/vtpm-deepquote.patch
 create mode 100644 recipes-extended/xen/files/vtpm-implicit-fallthrough.patch
 create mode 100644 recipes-extended/xen/files/vtpm-locality.patch
 create mode 100644 recipes-extended/xen/files/vtpm-parent-sign-ek.patch
 create mode 100644 recipes-extended/xen/tpm-emulator.inc
 create mode 100644 recipes-extended/xen/tpm-emulator_0.7.4.bb

diff --git a/recipes-extended/xen/files/tpmemu-0.7.4.patch b/recipes-extended/xen/files/tpmemu-0.7.4.patch
new file mode 100644
index 0000000..b84eff1
--- /dev/null
+++ b/recipes-extended/xen/files/tpmemu-0.7.4.patch
@@ -0,0 +1,12 @@
+diff -Naur tpm_emulator-x86_64-back/tpm/tpm_emulator_extern.c tpm_emulator-x86_64/tpm/tpm_emulator_extern.c
+--- tpm_emulator-x86_64-back/tpm/tpm_emulator_extern.c	2012-04-27 10:55:46.581963398 -0400
++++ tpm_emulator-x86_64/tpm/tpm_emulator_extern.c	2012-04-27 10:56:02.193034152 -0400
+@@ -249,7 +249,7 @@
+ #else /* TPM_NO_EXTERN */
+
+ int (*tpm_extern_init)(void)                                      = NULL;
+-int (*tpm_extern_release)(void)                                   = NULL;
++void (*tpm_extern_release)(void)                                   = NULL;
+ void* (*tpm_malloc)(size_t size)                                  = NULL;
+ void (*tpm_free)(/*const*/ void *ptr)                             = NULL;
+ void (*tpm_log)(int priority, const char *fmt, ...)               = NULL;
diff --git a/recipes-extended/xen/files/vtpm-bufsize.patch b/recipes-extended/xen/files/vtpm-bufsize.patch
new file mode 100644
index 0000000..9c9304c
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm-bufsize.patch
@@ -0,0 +1,13 @@
+diff --git a/config.h.in b/config.h.in
+index d16a997..8088a2a 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -27,7 +27,7 @@
+ #define TPM_STORAGE_NAME "${TPM_STORAGE_NAME}"
+ #define TPM_DEVICE_NAME  "${TPM_DEVICE_NAME}"
+ #define TPM_LOG_FILE     "${TPM_LOG_FILE}"
+-#define TPM_CMD_BUF_SIZE 4096
++#define TPM_CMD_BUF_SIZE 4088
+ 
+ #endif /* _CONFIG_H_ */
+ 
diff --git a/recipes-extended/xen/files/vtpm-cmake-Wextra.patch b/recipes-extended/xen/files/vtpm-cmake-Wextra.patch
new file mode 100644
index 0000000..a603654
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm-cmake-Wextra.patch
@@ -0,0 +1,21 @@
+---
+ CMakeLists.txt |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: tpm_emulator-x86_64/CMakeLists.txt
+===================================================================
+--- tpm_emulator-x86_64.orig/CMakeLists.txt
++++ tpm_emulator-x86_64/CMakeLists.txt
+@@ -40,10 +40,11 @@ set(TPM_STORAGE_NAME "/var/lib/tpm/tpm_e
+ set(TPM_DEVICE_NAME "/dev/tpm")
+ endif()
+ configure_file(${CMAKE_CURRENT_SOURCE_DIR}/config.h.in ${CMAKE_CURRENT_BINARY_DIR}/config.h)
+-add_definitions(-Wall -Werror -Wno-unused-parameter -Wpointer-arith -Wcast-align -Wwrite-strings)
++add_definitions(-Wall -Werror)
+ if("${CMAKE_SYSTEM}" MATCHES "Linux")
+     add_definitions(-Wextra)
+ endif()
++add_definitions(-Wno-unused-parameter -Wpointer-arith -Wcast-align -Wwrite-strings)
+ if(USE_OPENSSL)
+     add_definitions(-DUSE_OPENSSL)
+ endif()
diff --git a/recipes-extended/xen/files/vtpm-deepquote-anyloc.patch b/recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
new file mode 100644
index 0000000..7b37d51
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
@@ -0,0 +1,127 @@
+diff --git a/tpm/tpm_cmd_handler.c b/tpm/tpm_cmd_handler.c
+index 69511d1..7545d51 100644
+--- a/tpm/tpm_cmd_handler.c
++++ b/tpm/tpm_cmd_handler.c
+@@ -3347,12 +3347,13 @@ static TPM_RESULT execute_TPM_DeepQuote(TPM_REQUEST *req, TPM_RESPONSE *rsp)
+ {
+ 	TPM_NONCE nonce;
+ 	TPM_RESULT res;
+-	UINT32 sigSize;
+-	BYTE *sig;
++	UINT32 quote_blob_size;
++	BYTE *quote_blob;
+ 	BYTE *ptr;
+ 	UINT32 len;
+ 	TPM_PCR_SELECTION myPCR;
+ 	TPM_PCR_SELECTION ptPCR;
++	UINT32 extraInfoFlags = 0;
+ 
+ 	tpm_compute_in_param_digest(req);
+ 
+@@ -3361,17 +3362,19 @@ static TPM_RESULT execute_TPM_DeepQuote(TPM_REQUEST *req, TPM_RESPONSE *rsp)
+ 	if (tpm_unmarshal_TPM_NONCE(&ptr, &len, &nonce)
+ 		|| tpm_unmarshal_TPM_PCR_SELECTION(&ptr, &len, &myPCR)
+ 		|| tpm_unmarshal_TPM_PCR_SELECTION(&ptr, &len, &ptPCR)
++		|| tpm_unmarshal_TPM_DEEP_QUOTE_INFO(&ptr, &len, &extraInfoFlags)
+ 		|| len != 0) return TPM_BAD_PARAMETER;
+ 
+-	res = TPM_DeepQuote(&nonce, &myPCR, &ptPCR, &req->auth1, &sigSize, &sig);
++	res = TPM_DeepQuote(&nonce, &myPCR, &ptPCR, &req->auth1, extraInfoFlags,
++		&quote_blob_size, &quote_blob);
+ 	if (res != TPM_SUCCESS) return res;
+-	rsp->paramSize = len = sigSize;
++	rsp->paramSize = len = quote_blob_size;
+ 	rsp->param = ptr = tpm_malloc(len);
+-	if (ptr == NULL || tpm_marshal_BLOB(&ptr, &len, sig, sigSize)) {
++	if (ptr == NULL || tpm_marshal_BLOB(&ptr, &len, quote_blob, quote_blob_size)) {
+ 		tpm_free(rsp->param);
+ 		res = TPM_FAIL;
+ 	}
+-	tpm_free(sig);
++	tpm_free(quote_blob);
+ 
+ 	return res;
+ }
+diff --git a/tpm/tpm_commands.h b/tpm/tpm_commands.h
+index 328d1be..a56dd5f 100644
+--- a/tpm/tpm_commands.h
++++ b/tpm/tpm_commands.h
+@@ -3077,6 +3077,7 @@ TPM_RESULT TPM_ParentSignEK(
+  * @myPCR: [in] PCR selection for the virtual TPM
+  * @ptPCR: [in] PCR selection for the hardware TPM
+  * @auth1: [in, out] Authorization protocol parameters
++ * @extraInfoFlags [in] Flags for including, kernel hash, group info, etc
+  * @sigSize: [out] The length of the returned digital signature
+  * @sig: [out] The resulting digital signature and PCR values
+  * Returns: TPM_SUCCESS on success, a TPM error code otherwise.
+@@ -3086,6 +3087,7 @@ TPM_RESULT TPM_DeepQuote(
+   TPM_PCR_SELECTION *myPCR,
+   TPM_PCR_SELECTION *ptPCR,
+   TPM_AUTH *auth1,
++  UINT32 extraInfoFlags,
+   UINT32 *sigSize,
+   BYTE **sig
+ );
+diff --git a/tpm/tpm_credentials.c b/tpm/tpm_credentials.c
+index c0d62e7..6586c22 100644
+--- a/tpm/tpm_credentials.c
++++ b/tpm/tpm_credentials.c
+@@ -183,7 +183,8 @@ TPM_RESULT TPM_OwnerReadInternalPub(TPM_KEY_HANDLE keyHandle, TPM_AUTH *auth1,
+ 
+ int endorsementKeyFresh = 0;
+ 
+-TPM_RESULT VTPM_GetParentQuote(TPM_DIGEST* data, TPM_PCR_SELECTION *sel, UINT32 *sigSize, BYTE **sig);
++TPM_RESULT VTPM_GetParentQuote(TPM_NONCE *data, TPM_PCR_SELECTION *sel,
++                               UINT32 extraInfoFlags, UINT32 *sigSize, BYTE **sig);
+ 
+ TPM_RESULT TPM_ParentSignEK(TPM_NONCE *externalData, TPM_PCR_SELECTION *sel,
+                             TPM_AUTH *auth1, UINT32 *sigSize, BYTE **sig)
+@@ -191,7 +192,7 @@ TPM_RESULT TPM_ParentSignEK(TPM_NONCE *externalData, TPM_PCR_SELECTION *sel,
+ 	TPM_PUBKEY pubKey;
+ 	TPM_RESULT res;
+ 	TPM_DIGEST hres;
+-
++	UINT32 extraInfoFlags = 0;
+ 	info("TPM_ParentSignEK()");
+ 
+ 	res = tpm_verify_auth(auth1, tpmData.permanent.data.ownerAuth, TPM_KH_OWNER);
+@@ -206,7 +207,7 @@ TPM_RESULT TPM_ParentSignEK(TPM_NONCE *externalData, TPM_PCR_SELECTION *sel,
+ 		res = TPM_FAIL;
+ 
+ 	if (res == TPM_SUCCESS)
+-		res = VTPM_GetParentQuote(&hres, sel, sigSize, sig);
++		res = VTPM_GetParentQuote((TPM_NONCE*)&hres, sel, extraInfoFlags, sigSize, sig);
+ 
+ 	free_TPM_PUBKEY(pubKey);
+ 	return res;
+@@ -218,7 +219,7 @@ static const BYTE dquot_hdr[] = {
+ 
+ TPM_RESULT TPM_DeepQuote(TPM_NONCE *externalData, TPM_PCR_SELECTION *myPCR,
+                          TPM_PCR_SELECTION *ptPCR, TPM_AUTH *auth1,
+-                         UINT32 *sigSize, BYTE **sig)
++                         UINT32 extraInfoFlags, UINT32 *quote_blob_size, BYTE **quote_blob)
+ {
+   TPM_RESULT res;
+   TPM_DIGEST hres;
+@@ -253,7 +254,7 @@ TPM_RESULT TPM_DeepQuote(TPM_NONCE *externalData, TPM_PCR_SELECTION *myPCR,
+ 
+   tpm_free(buf);
+ 
+-	res = VTPM_GetParentQuote(&hres, ptPCR, sigSize, sig);
++  res = VTPM_GetParentQuote((TPM_NONCE*)&hres, ptPCR, extraInfoFlags, quote_blob_size, quote_blob);
+ 
+   return res;
+ }
+diff --git a/tpm/tpm_marshalling.h b/tpm/tpm_marshalling.h
+index d510ebe..2e0c008 100644
+--- a/tpm/tpm_marshalling.h
++++ b/tpm/tpm_marshalling.h
+@@ -268,6 +268,8 @@ static inline int tpm_unmarshal_BOOL(BYTE **ptr, UINT32 *length, BOOL *v)
+ #define tpm_unmarshal_TPM_REDIR_COMMAND        tpm_unmarshal_UINT32
+ #define tpm_marshal_DAAHANDLE                  tpm_marshal_UINT32
+ #define tpm_unmarshal_DAAHANDLE                tpm_unmarshal_UINT32
++#define tpm_marshal_TPM_DEEP_QUOTE_INFO        tpm_marshal_UINT32
++#define tpm_unmarshal_TPM_DEEP_QUOTE_INFO      tpm_unmarshal_UINT32
+ 
+ int tpm_marshal_UINT32_ARRAY(BYTE **ptr, UINT32 *length, UINT32 *v, UINT32 n);
+ int tpm_unmarshal_UINT32_ARRAY(BYTE **ptr, UINT32 *length, UINT32 *v, UINT32 n);
diff --git a/recipes-extended/xen/files/vtpm-deepquote.patch b/recipes-extended/xen/files/vtpm-deepquote.patch
new file mode 100644
index 0000000..6344f38
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm-deepquote.patch
@@ -0,0 +1,187 @@
+diff --git a/tpm/tpm_cmd_handler.c b/tpm/tpm_cmd_handler.c
+index 0fabf98..69511d1 100644
+--- a/tpm/tpm_cmd_handler.c
++++ b/tpm/tpm_cmd_handler.c
+@@ -3343,6 +3343,39 @@ static TPM_RESULT execute_TPM_ParentSignEK(TPM_REQUEST *req, TPM_RESPONSE *rsp)
+ 	return res;
+ }
+ 
++static TPM_RESULT execute_TPM_DeepQuote(TPM_REQUEST *req, TPM_RESPONSE *rsp)
++{
++	TPM_NONCE nonce;
++	TPM_RESULT res;
++	UINT32 sigSize;
++	BYTE *sig;
++	BYTE *ptr;
++	UINT32 len;
++	TPM_PCR_SELECTION myPCR;
++	TPM_PCR_SELECTION ptPCR;
++
++	tpm_compute_in_param_digest(req);
++
++	ptr = req->param;
++	len = req->paramSize;
++	if (tpm_unmarshal_TPM_NONCE(&ptr, &len, &nonce)
++		|| tpm_unmarshal_TPM_PCR_SELECTION(&ptr, &len, &myPCR)
++		|| tpm_unmarshal_TPM_PCR_SELECTION(&ptr, &len, &ptPCR)
++		|| len != 0) return TPM_BAD_PARAMETER;
++
++	res = TPM_DeepQuote(&nonce, &myPCR, &ptPCR, &req->auth1, &sigSize, &sig);
++	if (res != TPM_SUCCESS) return res;
++	rsp->paramSize = len = sigSize;
++	rsp->param = ptr = tpm_malloc(len);
++	if (ptr == NULL || tpm_marshal_BLOB(&ptr, &len, sig, sigSize)) {
++		tpm_free(rsp->param);
++		res = TPM_FAIL;
++	}
++	tpm_free(sig);
++
++	return res;
++}
++
+ static void tpm_setup_rsp_auth(TPM_COMMAND_CODE ordinal, TPM_RESPONSE *rsp) 
+ {
+   tpm_hmac_ctx_t hmac;
+@@ -4098,6 +4131,11 @@ void tpm_execute_command(TPM_REQUEST *req, TPM_RESPONSE *rsp)
+       res = execute_TPM_ParentSignEK(req, rsp);
+     break;
+ 
++    case TPM_ORD_DeepQuote:
++      debug("[TPM_ORD_DeepQuote]");
++      res = execute_TPM_DeepQuote(req, rsp);
++    break;
++
+     default:
+ #ifdef MTM_EMULATOR
+       res = mtm_execute_command(req, rsp);
+diff --git a/tpm/tpm_commands.h b/tpm/tpm_commands.h
+index 7fef934..328d1be 100644
+--- a/tpm/tpm_commands.h
++++ b/tpm/tpm_commands.h
+@@ -3071,6 +3071,25 @@ TPM_RESULT TPM_ParentSignEK(
+   BYTE **sig
+ );
+ 
++/**
++ * TPM_DeepQuote - gets a hardware TPM quote of a vTPM's PCRs
++ * @externalData: [in] AntiReplay nonce to prevent replay of messages
++ * @myPCR: [in] PCR selection for the virtual TPM
++ * @ptPCR: [in] PCR selection for the hardware TPM
++ * @auth1: [in, out] Authorization protocol parameters
++ * @sigSize: [out] The length of the returned digital signature
++ * @sig: [out] The resulting digital signature and PCR values
++ * Returns: TPM_SUCCESS on success, a TPM error code otherwise.
++ */
++TPM_RESULT TPM_DeepQuote(
++  TPM_NONCE *externalData,
++  TPM_PCR_SELECTION *myPCR,
++  TPM_PCR_SELECTION *ptPCR,
++  TPM_AUTH *auth1,
++  UINT32 *sigSize,
++  BYTE **sig
++);
++
+ /*
+  * Error handling
+  * [tpm_error.c]
+diff --git a/tpm/tpm_credentials.c b/tpm/tpm_credentials.c
+index 01f29e6..c0d62e7 100644
+--- a/tpm/tpm_credentials.c
++++ b/tpm/tpm_credentials.c
+@@ -211,3 +211,49 @@ TPM_RESULT TPM_ParentSignEK(TPM_NONCE *externalData, TPM_PCR_SELECTION *sel,
+ 	free_TPM_PUBKEY(pubKey);
+ 	return res;
+ }
++
++static const BYTE dquot_hdr[] = {
++	0, 0, 0, 0, 'D', 'Q', 'U', 'T'
++};
++
++TPM_RESULT TPM_DeepQuote(TPM_NONCE *externalData, TPM_PCR_SELECTION *myPCR,
++                         TPM_PCR_SELECTION *ptPCR, TPM_AUTH *auth1,
++                         UINT32 *sigSize, BYTE **sig)
++{
++	TPM_RESULT res;
++	TPM_DIGEST hres;
++	TPM_PCR_INFO_SHORT pcrData;
++	tpm_sha1_ctx_t ctx;
++	BYTE *buf, *ptr;
++	UINT32 size, len;
++
++	info("TPM_DeepQuote()");
++
++	res = tpm_verify_auth(auth1, tpmData.permanent.data.ownerAuth, TPM_KH_OWNER);
++	if (res != TPM_SUCCESS) return res;
++
++	res = tpm_compute_pcr_digest(myPCR, &pcrData.digestAtRelease, NULL);
++	if (res != TPM_SUCCESS) return res;
++
++	pcrData.pcrSelection.sizeOfSelect = myPCR->sizeOfSelect;
++	memcpy(pcrData.pcrSelection.pcrSelect, myPCR->pcrSelect, myPCR->sizeOfSelect);
++	pcrData.localityAtRelease = 1 << tpmData.stany.flags.localityModifier;
++
++	size = len = sizeof_TPM_PCR_INFO_SHORT(pcrData);
++	buf = ptr = tpm_malloc(size);
++	if (buf == NULL) return TPM_NOSPACE;
++	if (tpm_marshal_TPM_PCR_INFO_SHORT(&ptr, &len, &pcrData))
++		return TPM_FAIL;
++
++	tpm_sha1_init(&ctx);
++	tpm_sha1_update(&ctx, dquot_hdr, 8);
++	tpm_sha1_update(&ctx, externalData->nonce, 20);
++	tpm_sha1_update(&ctx, buf, size);
++	tpm_sha1_final(&ctx, hres.digest);
++
++	tpm_free(buf);
++
++	res = VTPM_GetParentQuote(&hres, ptPCR, sigSize, sig);
++
++	return res;
++}
+diff --git a/tpm/tpm_structures.h b/tpm/tpm_structures.h
+index b0f4625..dfb1894 100644
+--- a/tpm/tpm_structures.h
++++ b/tpm/tpm_structures.h
+@@ -660,6 +660,42 @@ typedef struct tdTPM_CMK_MA_APPROVAL {
+ 
+ /* VTPM-only commands: */
+ /*
++ * Deep Quote - Create quote of PCRs
++ * Input:
++ *   TPM_TAG             tag           TPM_TAG_RQU_AUTH1_COMMAND
++ *   UINT32              paramSize     Total size of request
++ *   TPM_COMMAND_CODE    ordinal       TPM_ORD_DeepQuote
++ *   TPM_NONCE           externData    20 bytes of external data
++ *   TPM_PCR_SELECTION   vtSel         PCR selection for virtual TPM
++ *   TPM_PCR_SELECTION   ptSel         PCR selection for physical TPM
++ *   ---
++ *   UINT32              authHandle    Owner authorization session (OIAP)
++ *   TPM_NONCE           nonceOdd      Nonce for authHandle
++ *   BOOL                continueAuth  Continue flag for authHandle
++ *   TPM_AUTHDATA        privAuth      Authorization digest for command
++ *
++ * Output:
++ *   TPM_TAG             tag           TPM_TAG_RSP_AUTH1_COMMAND
++ *   UINT32              paramSize     Total size of response
++ *   TPM_RESULT          returnCode    Return code of the operation
++ *   BYTE[]              sig           Signature provided by physical TPM
++ *   TPM_PCRVALUE[]      pcrValue      Values of hardware PCRs used in the quote
++ *   ---
++ *   TPM_NONCE           nonceEven     Nonce for authHandle
++ *   BOOL                continueAuth  Continue flag for authHandle
++ *   TPM_AUTHDATA        resAuth       Authorization digest for response
++ *
++ * The values of the virutal TPM's PCRs are not included in the response.
++ * The signature is a standard TPM_Quote response from the physical TPM; its
++ * externalData is the SHA1 hash of the following structure:
++ *   TPM_STRUCT_VER      version       MUST be 0.0.0.0
++ *   BYTE[4]             fixed         MUST be the string "DQUT"
++ *   TPM_NONCE           externData    From input to the deep quote
++ *   TPM_PCR_INFO_SHORT  pcrData       Virtual TPM's PCRs
++ */
++#define TPM_ORD_DeepQuote                       (TPM_VENDOR_COMMAND | TPM_ORD_Quote)
++
++/*
+  * ParentSignEK - Proof of fresh provisioning and EK value
+  *
+  * Input:
diff --git a/recipes-extended/xen/files/vtpm-implicit-fallthrough.patch b/recipes-extended/xen/files/vtpm-implicit-fallthrough.patch
new file mode 100644
index 0000000..db97be5
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm-implicit-fallthrough.patch
@@ -0,0 +1,10 @@
+--- tpm_emulator-x86_64/tpm/tpm_cmd_handler.c.orig	2017-04-27 13:37:14.408000000 +0200
++++ tpm_emulator-x86_64/tpm/tpm_cmd_handler.c	2017-04-27 13:39:53.585000000 +0200
+@@ -3397,6 +3397,7 @@
+                   sizeof(rsp->auth2->nonceOdd.nonce));
+       tpm_hmac_update(&hmac, (BYTE*)&rsp->auth2->continueAuthSession, 1);
+       tpm_hmac_final(&hmac, rsp->auth2->auth);
++      /* fall-thru */
+     case TPM_TAG_RSP_AUTH1_COMMAND:
+       tpm_hmac_init(&hmac, rsp->auth1->secret, sizeof(rsp->auth1->secret));
+       tpm_hmac_update(&hmac, rsp->auth1->digest, sizeof(rsp->auth1->digest));
diff --git a/recipes-extended/xen/files/vtpm-locality.patch b/recipes-extended/xen/files/vtpm-locality.patch
new file mode 100644
index 0000000..8ab7dea
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm-locality.patch
@@ -0,0 +1,50 @@
+diff --git a/tpm/tpm_capability.c b/tpm/tpm_capability.c
+index 60bbb90..f8f7f0f 100644
+--- a/tpm/tpm_capability.c
++++ b/tpm/tpm_capability.c
+@@ -949,6 +949,8 @@ static TPM_RESULT set_vendor(UINT32 subCap, BYTE *setValue,
+                              UINT32 setValueSize, BOOL ownerAuth,
+                              BOOL deactivated, BOOL disabled)
+ {
++  if (tpmData.stany.flags.localityModifier != 8)
++    return TPM_BAD_PARAMETER;
+   /* set the capability area with the specified data, on failure
+      deactivate the TPM */
+   switch (subCap) {
+diff --git a/tpm/tpm_cmd_handler.c b/tpm/tpm_cmd_handler.c
+index 288d1ce..9e1cfb4 100644
+--- a/tpm/tpm_cmd_handler.c
++++ b/tpm/tpm_cmd_handler.c
+@@ -4132,7 +4132,7 @@ void tpm_emulator_shutdown()
+   tpm_extern_release();
+ }
+ 
+-int tpm_handle_command(const uint8_t *in, uint32_t in_size, uint8_t **out, uint32_t *out_size)
++int tpm_handle_command(const uint8_t *in, uint32_t in_size, uint8_t **out, uint32_t *out_size, int locality)
+ {
+   TPM_REQUEST req;
+   TPM_RESPONSE rsp;
+@@ -4140,7 +4140,9 @@ int tpm_handle_command(const uint8_t *in, uint32_t in_size, uint8_t **out, uint3
+   UINT32 len;
+   BOOL free_out;
+ 
+-  debug("tpm_handle_command()");
++  debug("tpm_handle_command(%d)", locality);
++  if (locality != -1)
++    tpmData.stany.flags.localityModifier = locality;
+ 
+   /* we need the whole packet at once, otherwise unmarshalling will fail */
+   if (tpm_unmarshal_TPM_REQUEST((uint8_t**)&in, &in_size, &req) != 0) {
+diff --git a/tpm/tpm_emulator.h b/tpm/tpm_emulator.h
+index eed749e..4c228bd 100644
+--- a/tpm/tpm_emulator.h
++++ b/tpm/tpm_emulator.h
+@@ -59,7 +59,7 @@ void tpm_emulator_shutdown(void);
+  * its usage. In case of an error, all internally allocated memory
+  * is released and the the state of out and out_size is unspecified.
+  */ 
+-int tpm_handle_command(const uint8_t *in, uint32_t in_size, uint8_t **out, uint32_t *out_size);
++int tpm_handle_command(const uint8_t *in, uint32_t in_size, uint8_t **out, uint32_t *out_size, int locality);
+ 
+ #endif /* _TPM_EMULATOR_H_ */
+ 
diff --git a/recipes-extended/xen/files/vtpm-parent-sign-ek.patch b/recipes-extended/xen/files/vtpm-parent-sign-ek.patch
new file mode 100644
index 0000000..14e66ee
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm-parent-sign-ek.patch
@@ -0,0 +1,196 @@
+diff --git a/tpm/tpm_cmd_handler.c b/tpm/tpm_cmd_handler.c
+index 9e1cfb4..0fabf98 100644
+--- a/tpm/tpm_cmd_handler.c
++++ b/tpm/tpm_cmd_handler.c
+@@ -3312,6 +3312,37 @@ static TPM_RESULT execute_TPM_OwnerReadPubek(TPM_REQUEST *req, TPM_RESPONSE *rsp
+   return res;
+ }
+ 
++static TPM_RESULT execute_TPM_ParentSignEK(TPM_REQUEST *req, TPM_RESPONSE *rsp)
++{
++	TPM_NONCE nonce;
++	TPM_RESULT res;
++	UINT32 sigSize;
++	BYTE *sig;
++	BYTE *ptr;
++	UINT32 len;
++	TPM_PCR_SELECTION targetPCR;
++
++	tpm_compute_in_param_digest(req);
++
++	ptr = req->param;
++	len = req->paramSize;
++	if (tpm_unmarshal_TPM_NONCE(&ptr, &len, &nonce)
++		|| tpm_unmarshal_TPM_PCR_SELECTION(&ptr, &len, &targetPCR)
++		|| len != 0) return TPM_BAD_PARAMETER;
++
++	res = TPM_ParentSignEK(&nonce, &targetPCR, &req->auth1, &sigSize, &sig);
++	if (res != TPM_SUCCESS) return res;
++	rsp->paramSize = len = sigSize;
++	rsp->param = ptr = tpm_malloc(len);
++	if (ptr == NULL || tpm_marshal_BLOB(&ptr, &len, sig, sigSize)) {
++		tpm_free(rsp->param);
++		res = TPM_FAIL;
++	}
++	tpm_free(sig);
++
++	return res;
++}
++
+ static void tpm_setup_rsp_auth(TPM_COMMAND_CODE ordinal, TPM_RESPONSE *rsp) 
+ {
+   tpm_hmac_ctx_t hmac;
+@@ -4062,6 +4093,11 @@ void tpm_execute_command(TPM_REQUEST *req, TPM_RESPONSE *rsp)
+       res = execute_TPM_OwnerReadPubek(req, rsp);
+     break;
+ 
++    case TPM_ORD_ParentSignEK:
++      debug("[TPM_ORD_ParentSignEK]");
++      res = execute_TPM_ParentSignEK(req, rsp);
++    break;
++
+     default:
+ #ifdef MTM_EMULATOR
+       res = mtm_execute_command(req, rsp);
+diff --git a/tpm/tpm_commands.h b/tpm/tpm_commands.h
+index a7666f6..7fef934 100644
+--- a/tpm/tpm_commands.h
++++ b/tpm/tpm_commands.h
+@@ -3054,6 +3054,23 @@ TPM_RESULT TPM_OwnerReadPubek(
+   TPM_PUBKEY *pubEndorsementKey 
+ );
+ 
++/**
++ * TPM_ParentSignEK - gets a hardware TPM quote of a vTPM's EK
++ * @externalData: [in] AntiReplay nonce to prevent replay of messages
++ * @sel: [in] PCR selection for the hardware TPM's quote
++ * @auth1: [in, out] Authorization protocol parameters
++ * @sigSize: [out] The length of the returned digital signature
++ * @sig: [out] The resulting digital signature and PCR values
++ * Returns: TPM_SUCCESS on success, a TPM error code otherwise.
++ */
++TPM_RESULT TPM_ParentSignEK(
++  TPM_NONCE *externalData,
++  TPM_PCR_SELECTION *sel,
++  TPM_AUTH *auth1,
++  UINT32 *sigSize,
++  BYTE **sig
++);
++
+ /*
+  * Error handling
+  * [tpm_error.c]
+diff --git a/tpm/tpm_credentials.c b/tpm/tpm_credentials.c
+index 9cd64af..01f29e6 100644
+--- a/tpm/tpm_credentials.c
++++ b/tpm/tpm_credentials.c
+@@ -180,3 +180,34 @@ TPM_RESULT TPM_OwnerReadInternalPub(TPM_KEY_HANDLE keyHandle, TPM_AUTH *auth1,
+     return TPM_BAD_PARAMETER;
+   }
+ }
++
++int endorsementKeyFresh = 0;
++
++TPM_RESULT VTPM_GetParentQuote(TPM_DIGEST* data, TPM_PCR_SELECTION *sel, UINT32 *sigSize, BYTE **sig);
++
++TPM_RESULT TPM_ParentSignEK(TPM_NONCE *externalData, TPM_PCR_SELECTION *sel,
++                            TPM_AUTH *auth1, UINT32 *sigSize, BYTE **sig)
++{
++	TPM_PUBKEY pubKey;
++	TPM_RESULT res;
++	TPM_DIGEST hres;
++
++	info("TPM_ParentSignEK()");
++
++	res = tpm_verify_auth(auth1, tpmData.permanent.data.ownerAuth, TPM_KH_OWNER);
++	if (res != TPM_SUCCESS) return res;
++
++	if (!endorsementKeyFresh) return TPM_DISABLED_CMD;
++
++	res = tpm_get_pubek(&pubKey);
++	if (res != TPM_SUCCESS) return res;
++
++	if (tpm_compute_pubkey_checksum(externalData, &pubKey, &hres))
++		res = TPM_FAIL;
++
++	if (res == TPM_SUCCESS)
++		res = VTPM_GetParentQuote(&hres, sel, sigSize, sig);
++
++	free_TPM_PUBKEY(pubKey);
++	return res;
++}
+diff --git a/tpm/tpm_data.c b/tpm/tpm_data.c
+index 50c9697..6a0c499 100644
+--- a/tpm/tpm_data.c
++++ b/tpm/tpm_data.c
+@@ -76,6 +76,8 @@ static void init_timeouts(void)
+   tpmData.permanent.data.cmd_durations[2] = 1000;
+ }
+ 
++extern int endorsementKeyFresh;
++
+ void tpm_init_data(void)
+ {
+   /* endorsement key */
+@@ -157,6 +159,7 @@ void tpm_init_data(void)
+   if (tpmConf & TPM_CONF_GENERATE_EK) {
+     /* generate a new endorsement key */
+     tpm_rsa_generate_key(&tpmData.permanent.data.endorsementKey, 2048);
++    endorsementKeyFresh = 1;
+   } else {
+     /* setup endorsement key */
+     tpm_rsa_import_key(&tpmData.permanent.data.endorsementKey, 
+diff --git a/tpm/tpm_structures.h b/tpm/tpm_structures.h
+index f746c05..b0f4625 100644
+--- a/tpm/tpm_structures.h
++++ b/tpm/tpm_structures.h
+@@ -658,6 +658,49 @@ typedef struct tdTPM_CMK_MA_APPROVAL {
+ #define TPM_ORD_TickStampBlob                   242
+ #define TPM_ORD_MAX                             256
+ 
++/* VTPM-only commands: */
++/*
++ * ParentSignEK - Proof of fresh provisioning and EK value
++ *
++ * Input:
++ *   TPM_TAG             tag           TPM_TAG_RQU_AUTH1_COMMAND
++ *   UINT32              paramSize     Total size of request
++ *   TPM_COMMAND_CODE    ordinal       TPM_ORD_ParentSignEK
++ *   TPM_NONCE           externData    20 bytes of external data
++ *   TPM_PCR_SELECTION   ptSel         PCR selection for physical TPM
++ *   ---
++ *   UINT32              authHandle    Owner authorization session (OIAP)
++ *   TPM_NONCE           nonceOdd      Nonce for authHandle
++ *   BOOL                continueAuth  Continue flag for authHandle
++ *   TPM_AUTHDATA        privAuth      Authorization digest for command
++ *
++ * Output:
++ *   TPM_TAG             tag           TPM_TAG_RSP_AUTH1_COMMAND
++ *   UINT32              paramSize     Total size of response
++ *   TPM_RESULT          returnCode    Return code of the operation
++ *   BYTE[]              sig           Signature provided by physical TPM
++ *   TPM_PCRVALUE[]      pcrValue      Values of hardware PCRs used in the quote
++ *   ---
++ *   TPM_NONCE           nonceEven     Nonce for authHandle
++ *   BOOL                continueAuth  Continue flag for authHandle
++ *   TPM_AUTHDATA        resAuth       Authorization digest for response
++ *
++ * This command is only valid on the first boot of a vTPM; on any subsequent
++ * boot, the command returns TPM_DISABLED_CMD. It is intended to be used to
++ * provide evidence of proper platform configuration to the verifier/CA which is
++ * responsible for the creation of the vTPM's endorsement credential, which will
++ * be used on subsequent boots to certify AIKs via the usual Privacy CA protocol.
++ *
++ * The values of the virtual TPM's PCRs are not included in the response.
++ * The signature is a standard TPM_Quote response from the physical TPM; its
++ * externalData is the SHA1 hash of the following structure:
++ *   TPM_PUBKEY          pubEK         The vTPM's public EK
++ *   TPM_NONCE           externData    From input to the deep quote
++ *
++ * This structure was chosen to match the return of TPM_ReadPubek
++ */
++#define TPM_ORD_ParentSignEK                    (TPM_VENDOR_COMMAND | TPM_ORD_ReadPubek)
++
+ /*
+  * TCS Ordinals ([TPM_Part2], Section 17.1)
+  *
diff --git a/recipes-extended/xen/tpm-emulator.inc b/recipes-extended/xen/tpm-emulator.inc
new file mode 100644
index 0000000..5cc4f02
--- /dev/null
+++ b/recipes-extended/xen/tpm-emulator.inc
@@ -0,0 +1,31 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS += "\
+    cmake-native \
+    newlib \
+    stubdom-gmp \
+"
+
+# even though there's nothing to configure, we still need this to run the "make links" target in mini-os
+do_configure(){
+}
+
+export CMAKE_C_FLAGS = "-std=c99 -DTPM_NO_EXTERN ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS} -Wno-declaration-after-statement -Wno-implicit-fallthrough"
+
+do_compile() {
+    CC="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT}" cmake .. -DCMAKE_C_FLAGS:STRING="${CMAKE_C_FLAGS}"
+    ${MAKE} VERBOSE=1 tpm_crypto tpm
+}
+
+do_install() {
+    install -d ${D}/${libdir}
+    install -m 644 -t ${D}/${libdir} ${B}/crypto/libtpm_crypto.a
+    install -m 644 -t ${D}/${libdir} ${B}/tpm/libtpm.a
+
+    install -D -m 644 -t ${D}/${includedir}/tpm-emulator/build ${S}/build/config.h
+    install -D -m 644 -t ${D}/${includedir}/tpm-emulator/crypto ${S}/crypto/*.h
+    install -D -m 644 -t ${D}/${includedir}/tpm-emulator/tpm ${S}/tpm/*.h    
+}
diff --git a/recipes-extended/xen/tpm-emulator_0.7.4.bb b/recipes-extended/xen/tpm-emulator_0.7.4.bb
new file mode 100644
index 0000000..ec14e51
--- /dev/null
+++ b/recipes-extended/xen/tpm-emulator_0.7.4.bb
@@ -0,0 +1,26 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "TPM Emulator"
+HOMEPAGE = "http://xenbits.xen.org/xen-extfiles"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://README;md5=eeabd77cf8fd8a8bc42983884cb09863"
+
+SRC_URI += "\
+    http://xenbits.xen.org/xen-extfiles/tpm_emulator-${PV}.tar.gz;name=${PN} \
+    file://tpmemu-0.7.4.patch;striplevel=1 \
+    file://vtpm-bufsize.patch;striplevel=1 \
+    file://vtpm-locality.patch;striplevel=1 \
+    file://vtpm-parent-sign-ek.patch;striplevel=1 \
+    file://vtpm-deepquote.patch;striplevel=1 \
+    file://vtpm-deepquote-anyloc.patch;striplevel=1 \
+    file://vtpm-cmake-Wextra.patch;striplevel=1 \
+    file://vtpm-implicit-fallthrough.patch;striplevel=1 \
+"
+SRC_URI[tpm-emulator.md5sum] = "e26becb8a6a2b6695f6b3e8097593db8"
+SRC_URI[tpm-emulator.sha256sum] = "4e48ea0d83dd9441cc1af04ab18cd6c961b9fa54d5cbf2c2feee038988dea459"
+
+S="${WORKDIR}/tpm_emulator-${PV}"
+B="${S}/build"
+
+require tpm-emulator.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *


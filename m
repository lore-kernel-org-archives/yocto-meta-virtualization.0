Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365C1C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 21:08:20 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.16485.1664917691542478119
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aD41BRbM;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id gb14so8926483qtb.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=dD5dvPr0mkiKwC5a5+QuD08Gvvifb8ap0Rc/5RTh0jE=;
        b=aD41BRbMZv4oDc76TE7Irgf4cgxZgWbhCZgqiqP/m7CORHq+GVFDp7bNSIe6FmjbUE
         5UlBkVlZUC5fV87RjBY9TGlsXtqc5u4hdWTBtzAF0M5n/f9idbO0UbR5DzEzVTJhhZwL
         5uWUhss6yNvvMfsdQ1bjiG8ASVhKpyrRW/81sszNnyzKtmPLdpVKBFuR73YBmWLHxoSy
         uZklsz/fATkTce+fi+Avn8igG7nLoxPNwrpNAbtqK2zTEIC4o4Iv7cLIMfZoRfqb5LeE
         H3y9OpPO6zcL9eLz0hQVzB4GEupsTfxjN51509KMI0K8yXKdSEyC6QCBKYphFX0Cnf36
         RxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dD5dvPr0mkiKwC5a5+QuD08Gvvifb8ap0Rc/5RTh0jE=;
        b=KTQCGhI9pvjiZSjfLbUVSWFxH+OGVXXnskNionFafzpYj8eD70ZtbbCJS9aBj6BkaB
         EaeoaChclkAibhX+JlTqN+8nrrg8EMjzjSVq68lcYijBjnd93GHIk87lqvB6Ce5P7O8I
         qm2Vs7vDmE2L9zge/TjQrsifOGKsaIvi8laE2OyULgf6NBMKdGEoJLtWPUbXNuOBXMf7
         1kkb2CzCCUkY2cRz7xFX5vO7yxbVDPMMsrN3nABe9htmqcXnWCGkDs+FzXO/lHXG/K/V
         mqBeEqo5Z02Mi19ttcK4oR/PTVbmxIK2JEP5MYC1CS5ppboztDB8l1job9nGnXo7Z7Na
         nQOg==
X-Gm-Message-State: ACrzQf3dU6SE4+gi1F+vOOY2SGXKHNDwvXzjY9H7kPx2vT0O6vMj9Kst
	ADnGkG/qRLo8muFc9mWvq9/HurpgG6CZyAWd
X-Google-Smtp-Source: 
 AMsMyM62RwYT5qc4Pt2jsyBK4hdPP+pHOlOkyv70oemYRfgoxW9v1DdacyYEzS0Yn4ralKY2unNAKw==
X-Received: by 2002:a05:622a:308:b0:35d:4f5c:abc6 with SMTP id
 q8-20020a05622a030800b0035d4f5cabc6mr21131564qtw.563.1664917690607;
        Tue, 04 Oct 2022 14:08:10 -0700 (PDT)
Received: from gmail.com
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 y3-20020a05620a44c300b006ce60296f97sm795398qkp.68.2022.10.04.14.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 14:08:10 -0700 (PDT)
Date: Tue, 4 Oct 2022 17:08:08 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-virtualization][PATCH] tini: fix function declaration
 without a prototype
Message-ID: <20221004210807.GD60875@gmail.com>
References: <20220930114601.3116137-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930114601.3116137-1-jose.quaresma@foundries.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Oct 2022 21:08:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7643

merged.

Bruce

In message: [meta-virtualization][PATCH] tini: fix function declaration without a prototype
on 30/09/2022 Jose Quaresma wrote:

> This also fix building with clang 1.15
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...n-declaration-without-a-prototype-is.patch | 74 +++++++++++++++++++
>  recipes-containers/tini/tini_0.19.0.bb        |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
> 
> diff --git a/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch b/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
> new file mode 100644
> index 0000000..96f3625
> --- /dev/null
> +++ b/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
> @@ -0,0 +1,74 @@
> +From 66d0b5fd94fafe1e15bf21a1b73618ca23de078f Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <jose.quaresma@foundries.io>
> +Date: Fri, 23 Sep 2022 16:31:33 +0000
> +Subject: [PATCH] tini.c: a function declaration without a prototype is
> + deprecated in all versions of C
> +
> +| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:150:18: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
> +| int isolate_child() {
> +|                  ^
> +|                   void
> +| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:395:14: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
> +| int parse_env() {
> +|              ^
> +|               void
> +| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:416:24: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
> +| int register_subreaper () {
> +|                        ^
> +|                         void
> +| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:434:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
> +| void reaper_check () {
> +|                   ^
> +|                    void
> +| 4 errors generated.
> +
> +:Upstream-Status: Submitted [https://github.com/krallin/tini/pull/198]
> +
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +---
> + src/tini.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/tini.c b/src/tini.c
> +index 2c873f9..7914d3a 100644
> +--- a/src/tini.c
> ++++ b/src/tini.c
> +@@ -147,7 +147,7 @@ int restore_signals(const signal_configuration_t* const sigconf_ptr) {
> + 	return 0;
> + }
> + 
> +-int isolate_child() {
> ++int isolate_child(void) {
> + 	// Put the child into a new process group.
> + 	if (setpgid(0, 0) < 0) {
> + 		PRINT_FATAL("setpgid failed: %s", strerror(errno));
> +@@ -392,7 +392,7 @@ int parse_args(const int argc, char* const argv[], char* (**child_args_ptr_ptr)[
> + 	return 0;
> + }
> + 
> +-int parse_env() {
> ++int parse_env(void) {
> + #if HAS_SUBREAPER
> + 	if (getenv(SUBREAPER_ENV_VAR) != NULL) {
> + 		subreaper++;
> +@@ -413,7 +413,7 @@ int parse_env() {
> + 
> + 
> + #if HAS_SUBREAPER
> +-int register_subreaper () {
> ++int register_subreaper (void) {
> + 	if (subreaper > 0) {
> + 		if (prctl(PR_SET_CHILD_SUBREAPER, 1)) {
> + 			if (errno == EINVAL) {
> +@@ -431,7 +431,7 @@ int register_subreaper () {
> + #endif
> + 
> + 
> +-void reaper_check () {
> ++void reaper_check (void) {
> + 	/* Check that we can properly reap zombies */
> + #if HAS_SUBREAPER
> + 	int bit = 0;
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/tini/tini_0.19.0.bb b/recipes-containers/tini/tini_0.19.0.bb
> index 914cffb..fd90f62 100644
> --- a/recipes-containers/tini/tini_0.19.0.bb
> +++ b/recipes-containers/tini/tini_0.19.0.bb
> @@ -8,6 +8,7 @@ SRCREV = "b9f42a0e7bb46efea0c9e3d8610c96ab53b467f8"
>  SRC_URI = " \
>    git://github.com/krallin/tini.git;branch=master;protocol=https \
>    file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
> +  file://0001-tini.c-a-function-declaration-without-a-prototype-is.patch \
>    "
>  
>  LICENSE = "MIT"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7637): https://lists.yoctoproject.org/g/meta-virtualization/message/7637
> Mute This Topic: https://lists.yoctoproject.org/mt/94014454/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



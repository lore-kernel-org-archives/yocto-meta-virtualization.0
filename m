Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62303CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 12:24:13 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12047.1791807845322527127
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 05:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=cOQyLxsN;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7BDA13D80F41;
	Mon, 12 Oct 2026 08:24:03 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id daeL-cGVO-LE; Mon, 12 Oct 2026 08:24:02 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3B7353D81657;
	Mon, 12 Oct 2026 08:24:02 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3B7353D81657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1791807842; bh=CLa43lv57v7OHAOv7FB03zAAOwP7DfFztPMEwv1/WPQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=cOQyLxsNEv2cTXOWEuGvqQ/KFsu9obTrU0LcRBgAJdizXK+FfPENrNS34zhc3dd34
	 JdOynGD+0NlS2kNOJikmJIKlqNQkDb7JikgW+8FmZBGLjeBeZTGhUeHaH7aSUoVzqW
	 +n5ygeHSTNs8hcPLVvk0NPLf8tCjOX7KPbN9XE3sQ0xj1kP3aBuc+S98F28MLO0FJM
	 sqzADoqqfMy6CPcZQWuiRk93DIRdasr1o5+98BHqrK0yyxe+5tHU1ZikZ4RnOn0NMb
	 Kzp6G3xvoXAXPEhjXo1/c3X3z1QWA/NLuXarqQ9thRFoxSh1WWg7wnSmWt9ijqf4uZ
	 gJZJtv57zKs2Q==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id sE9SWt9VPlxc; Mon, 12 Oct 2026 08:24:02 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 097DA3D80F41;
	Mon, 12 Oct 2026 08:24:02 -0400 (EDT)
Date: Mon, 12 Oct 2026 08:24:02 -0400 (EDT)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	enguerrand de-ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Message-ID: <1760387508.1766093.1791807841997.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com> <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com>
Subject: Re: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime
 bundle output
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 10.1.20_GA_0326 (ZimbraWebClient - FF157 (Linux)/10.1.20_GA_0326)
X-Zimbra-Message-Verification: hash=SHA256;guid=MjFhZjZjNWVhZjgwMjI3NTg4MDI2ZWIwNWM4ZDUwZmJiMWE1ZjU1MTliZDI5NDYxZjFmZjRmNTQyNjVjOTMxNg==
Thread-Topic: image-oci: add OCI runtime bundle output
Thread-Index: s5m5oZmneL/ageMIBL+j86/pLwjiAw==
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Oct 2026 12:24:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10109

Hello Bruce,

Thanks for the review !

> I can see some value in emitting the bundle directly. But that piece
> is trivially scriptable downstream from an OCI container that's
> already built: one `umoci unpack` at deploy time gets you there,
> and doesn't have to be baked into image-oci as a build-time output
> to be reachable.

I am working with an embedded system that that will use container and for
which, we need to maximize the performance. This is why crun was chosen.
For this I need to generate an OCI bundle image, and we want it to be
fully handled by Yocto. Running umoci unpack during deployment would add
a preparation step outside our Yocto build, which does not meet our
project requirements.

> The part I object to more strongly is the modification-to-make-it-
> runnable half. OCI_BUNDLE_POSTPROCESS_COMMAND (jq-mutate config.json,
> or drop config.json in from SRC_URI) is hidden logic that mutates
> container output bytes after the recipe has finished expressing what
> the container is. That can't be a first-class output of the layer.
> First-class means the recipe/variables describe the container end-to-
> end, and someone reading the recipe can tell what will land in
> config.json without also reading a post-hook shell function that
> patches it afterward. Layered together with the 2/2 pattern
> ("require app-container.bb; OCI_IMAGE_BUNDLE_OUTPUT = 1"), it's a
> way to define effectively a new container by appending post-hooks
> onto an unrelated image recipe. Every image-oci build silently
> becomes two products with the second one shaped by hidden logic.
> That's the side door.

Yes, I agree.
I added the post-processing hook because we expect to need runtime
settings such as mounts, capabilities, and namespaces. But it lets the
bundle's configuration diverge through changes that are not expressed
as recipe-level settings. Would first-class, bundle-specific variables
in image-oci be an appropriate way to declare those runtime settings
while generating the bundle from the finalized image?

> One question that would help me understand the motivation of what
> you're after: is the goal here to produce multiple containers from a
> single image construction, and the bundle+postprocess pair is the
> plumbing you found that gets close to that? If so, the current patch
> is still 1-image-to-1-bundle so it doesn't actually get you there
> either, and that's a different discussion worth having on its own.

> If the goal is just "1 image, 1 bundle, but with config.json tweaks
> the current OCI_IMAGE_* variables can't express", then let me know the
> missing knobs and we can look at adding them as first-class variables
> in image-oci (the recipe-level path), rather than as a post-hook that
> sits outside the image-config machinery.

Yes, the goal is simply to produce one OCI bundle with one image recipe.
The OCI image that will also be generated will never be used in my case.
The settings I expect to need include mounts, capabilities, namespaces,
etc. As I understand it, these are runtime-spec settings in config.json,
not fields of the OCI image configuration, so the current OCI_IMAGE_*
variables cannot express them in the image itself

I would be interested to get feedback on the best approach to generate
the OCI bundle fully within Yocto, without relying on post-processing
hooks, so I can update the patch accordingly.

Best regards,
Tanguy Raufflet


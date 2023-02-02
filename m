Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F95EC61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 20:51:35 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.3277.1675371087051618104
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 12:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.41] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 312KpPsN004928
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 2 Feb 2023 14:51:26 -0600
Message-ID: <dda91366-c250-a853-576c-388e8a168cab@kernel.crashing.org>
Date: Thu, 2 Feb 2023 14:51:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Content-Language: en-US
To: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization] QEMU vmsep/virtfs setting
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Feb 2023 20:51:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7842

I've encountered an issue.  When I build nativesdk-qemu for mingw32 target I'm 
getting a failure.  Below is my attempt to figure out what is going wrong.

nativesdk-qemu is depending on libcap-ng for some reason, which does not compile 
for mingw32.  Looking into how this dependency is coming about what appears to 
be happening is "virtfs" support is being enabled which triggers the dependency.

Looking at the bitbake -e output, what I see is:

https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/qemu/qemu-package-split.inc#n46

This is running for me in both the target and nativesdk configurations.  Trying 
to understand why it's enable, go back to the caller:

https://git.yoctoproject.org/meta-virtualization/tree/recipes-devtools/qemu/qemu_%25.bbappend

It SHOULD only be loading that file if 'vmsep' is enabled, but I believe due to 
the way bitbake, oe-core and BBCLASSEXTEND works, the nativesdk file includes 
work the same way for both target and nativesdk.  Looking at my DISTRO_FEATURES, 
my target does include 'vmsep', but my nativesdk does not.

So hopefully this explains the failure, the target has vmsep, so the require 
always kicks in, which causes 'virtfs' to always be added to the configuration.

I see two possible solutions to this:

1) Make the virtfs class-target specific.  This would match the prior lines and 
how they are arranged.  However, it's unclear to me if this was intended to be 
target specific or also alter and SDKs configuration.

2) Only enable virtfs for a Linux system (target or nativesdk), I think this can 
be done using an override one way or another.

So for #1 the change would be something like:

-PACKAGECONFIG:append = " virtfs"
+PACKAGECONFIG:append:class-target = " virtfs"


So for #2 the change would be something like:

-PACKAGECONFIG:append = " virtfs"
+ENABLE_VIRTFS = " virtfs"
+ENABLE_VRITFS:sdkmingw32 = ""
+
+PACKAGECONFIG:append = "${ENABLE_VIRTFS}"


I'm happy to submit a proper pull request, but I'm not sure what direction to go 
to fix this.

Thanks!
--Mark


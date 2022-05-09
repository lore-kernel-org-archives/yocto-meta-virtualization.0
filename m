Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86A4C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 12:47:54 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web09.31436.1652100465426002770
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 05:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HHqVTW90;
 spf=pass (domain: gmail.com, ip: 209.85.219.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id s30so24722842ybi.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhAbrvPcu2xIlEgmNa7oIR+VeT7aeuIeSUYwScwpPjk=;
        b=HHqVTW90Fj1KmpiJWJpPFBBoKPegL7Qms5X01R331NyBbihXDPOHW9khwLGXoPDSGX
         JbVzzUR0opbwrGLrXu+PXYAF08Zomt6PcSlEMj/zaqWv5u062zExcI8gPFhpQy+8tHWj
         dqPiPr8yN5/96BqClCQ/yqFlmQ8q6Ev6RTFXlQnsHdx+CQIk9uslnmXBQtn9gutKcfxx
         DoQnlyRSJMyJTMNGa9Us5XD+HlA1qnxmuzWdRcIpzt3V4lErb4JIbTUsZNATS+Pl6q5L
         UjvjVW+k8DjqhHjllWNtlcfdFPtrghTmpDdL77/J3pczQzQPVm8RTLP8+cqdP6ZJ6tAR
         jXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhAbrvPcu2xIlEgmNa7oIR+VeT7aeuIeSUYwScwpPjk=;
        b=mignVNECbzo9Jq8VV6j5+1e6CkCumq4I+XLQiCPXYHx5InD7WWEyMjJOya37RJ3tj2
         xX4ZPBHcEt4Dlu86SuWiOGQgreXzL68de8c8I3WGXJc9YC78SmjX6TK8CqtOqvi4LUpW
         yD4FWeKCj5WzPKf8ZPxf6IZQ4B15nCCTnseF/yJqWY+L+uslX3GJks92fphNRQim3Lb8
         xbfktgq5DTjwPn1rUkojZVh48qjbJzFIByLqjIWc7UMgbMybSurJeyt4bHsKIvHkf29+
         1Mrp6MUvYdSdp9iPRaR+iGnJudL8oHmU7TKKjkf4L2i+p2jJAewvFdNED5bsYkkcniSC
         Yi0g==
X-Gm-Message-State: AOAM531C/cV5nOPIyVOTqP47lhdYWBPKfGHcLx+qvL1Y8WCvWWQEyb86
	TFr271vnts8hWsAnrQ2uM8tAITFWgA8j2we+XSQ=
X-Google-Smtp-Source: 
 ABdhPJxk6rfSQh9gyA2qpK0tjDK+R+cB3nx93oevIzi2reG9PW+4mJ5V/dSaQfd62NZtO/kqO0zr7/U/7IBCerGk+Z0=
X-Received: by 2002:a25:b6c9:0:b0:64a:9f32:5ac4 with SMTP id
 f9-20020a25b6c9000000b0064a9f325ac4mr8489278ybm.131.1652100464558; Mon, 09
 May 2022 05:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
In-Reply-To: <20220428000609.26814-1-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 May 2022 08:47:33 -0400
Message-ID: 
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu integration
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Doug Goldstein <cardoe@cardoe.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
	Scott Davis <scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>,
	Jon Mason <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 12:47:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7255

On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> A series of improvements to Qemu integration with the Xen recipes:
>
> - update the Qemu package dependency for the x86 Xen tools
> - add support for testing Arm 32-bit images with Qemu and testimage
> - configure a standard Xen bridged network xenbr0 for Xen images in qemu
>   to improve support for configuring guest virtual machine networking
>
> v2 coalesces these patches into a series and addresses feedback on v1

I've gone ahead and merged all three patches of the v2 series.

As for the qemuarm boot (with uboot or not), we can address that in
follow up patches, since I see that Betrand did send what he's been
using to the list. And I'm interested to hear if that also works for
Christopher.

Bruce


>
> Christopher Clark (3):
>   xen, xen-tools: add recommendation for Qemu for non-hvm x86
>   qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
>   xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage
>
>  classes/qemuboot-testimage-network.bbclass   |  36 +++++-
>  classes/qemuboot-xen-defaults.bbclass        |  26 +++-
>  classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
>  conf/distro/include/meta-virt-xen.inc        |   1 +
>  recipes-extended/images/xen-image-minimal.bb |   8 +-
>  recipes-extended/xen/xen-tools.inc           |   9 +-
>  recipes-extended/xen/xen.inc                 |   6 +-
>  7 files changed, 197 insertions(+), 17 deletions(-)
>  create mode 100644 classes/qemuboot-xen-u-boot.bbclass
>
> --
> 2.25.1
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


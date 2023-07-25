Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA8FEB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 18:58:45 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.28675.1690311516651271099
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 11:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ug7gtdhc;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-63cf7cce5fbso21770886d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jul 2023 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690311515; x=1690916315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27mBEaSZF5ri2wrCK1ymnSizGGA5epaDrWP33JZbER8=;
        b=Ug7gtdhcyVn2ROhuBN8gzQxDqUxheAOpb0cLCVY7POUECu/BFeCmvkNXKnSYu6ZX6y
         xhvk4YQHK9e/9cHfGiINXjcpweZMgXUulfSCxVW/WesZM1BZ2BTPQLCSDl+EK5aeQhJz
         twuOzyHuy+rcKAMvjZr8YXW2lttiN24gex4LhevE5bUhy5Mw772HHAR/YJSMMj3OgjD0
         KHX6SWCvxolRG0V0ZTuqSQEFInC/MdwpTIG/8CWpyGUvT6ciF0s1UG59lftxUUPEO53u
         Z3VU2WtLEwg440lV0cTZoEg93Ahn5STGrRuyN5ng4RfxFbEd0CwepK4NEYdtmeVOHC/M
         trOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690311515; x=1690916315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27mBEaSZF5ri2wrCK1ymnSizGGA5epaDrWP33JZbER8=;
        b=NcbqTIDqK4VrVA9bE1UFFt1Xp3xLgMIOLIgjGhxDCBQzg6L+crn/ZGYG04l99lmr7/
         KkoOCDMcw3b2jQG4BynZJ2bKuRyC5HCvi+nLz0LOSPb02jLHzexARd7h2xiES5YSoHFs
         GS1cFCGWpS1XVC6HjiaBcbsZpuzTe+0YJWVru6OQQzqyZLGfTKQjyBLXKaXWec1aRZ/F
         OTPW+SwivCJOrGqdMUCyyUgUaSIJLYsXQ+mVrHceNOINbqu90SvTof762km7ttwKrD/u
         OBK4268nSaD2HZyDKrHnAyFhUtQPIxuRXcy1zEDZsxZ1EiRjADycJD1PVMMMggy8P7ai
         ayRg==
X-Gm-Message-State: ABy/qLafWfFLu6qx6mdldtfM/iohBUbZk+MLKJw9cjZI7+4/1ldAtboW
	AvvVAXLR23SlBiMGGqhEr49lviYe9tr9uw==
X-Google-Smtp-Source: APBJJlGynRLzWLGZaZGnnqre6ItBHtnOJwTr6/4BSndnUosNSqH1txaMPDR0nxwg6BcVsDTdjV/yrA==
X-Received: by 2002:ad4:4e61:0:b0:639:91be:2f1a with SMTP id ec1-20020ad44e61000000b0063991be2f1amr3074661qvb.60.1690311515593;
        Tue, 25 Jul 2023 11:58:35 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id q10-20020a0ce20a000000b00631fea4d5bcsm4533826qvl.95.2023.07.25.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 11:58:35 -0700 (PDT)
Date: Tue, 25 Jul 2023 14:58:33 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][mickledore][PATCH] ovs: fix some
 installed packages in openvswitch cannot be executed
Message-ID: <ZMAbWUXkHAHOs2a+@gmail.com>
References: <20230721090432.3664891-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721090432.3664891-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jul 2023 18:58:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8136

merged.

Bruce

In message: [meta-virtualization][master][mickledore][PATCH] ovs: fix some installed packages in openvswitch cannot be executed
on 21/07/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> The variable "PYTHON3" in Makefile.am set as python3, this cause the following scripts error:
> 
> /usr/sbin/ovs-bugtool Not found the interpreter python3
> /usr/bin/ovs-pcap Not found the interpreter python3
> /usr/bin/ovs-test Not found the interpreter python3
> /usr/bin/ovs-tcpdump Not found the interpreter python3
> /usr/bin/ovs-tcpundump Not found the interpreter python3
> /usr/bin/ovs-vlan-test Not found the interpreter python3
> /usr/bin/ovs-l3ping Not found the interpreter python3
> /usr/bin/ovs-parse-backtrace Not found the interpreter python3
> /usr/bin/ovs-dpctl-top Not found the interpreter python3
> /usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
> /usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
> /usr/share/openvswitch/scripts/ovs-monitor-ipsec Not found the interpreter python3
> /usr/share/openvswitch/scripts/ovs-vtep Not found the interpreter python3
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...the-python3-interpreter-with-usr-bin.patch | 43 +++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch
> 
> diff --git a/recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch b/recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch
> new file mode 100644
> index 0000000..472ecb5
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/Makefile.am-set-the-python3-interpreter-with-usr-bin.patch
> @@ -0,0 +1,43 @@
> +From 5053d98f6595653dc02485810fda94348b6e8a1b Mon Sep 17 00:00:00 2001
> +From: Xiangyu Chen <xiangyu.chen@windriver.com>
> +Date: Fri, 21 Jul 2023 08:47:51 +0000
> +Subject: [PATCH] Makefile.am: set the python3 interpreter with /usr/bin/env
> +
> +The variable "PYTHON3" just python3, this cause the following scripts error:
> +/usr/sbin/ovs-bugtool Not found the interpreter python3
> +/usr/bin/ovs-pcap Not found the interpreter python3
> +/usr/bin/ovs-test Not found the interpreter python3
> +/usr/bin/ovs-tcpdump Not found the interpreter python3
> +/usr/bin/ovs-tcpundump Not found the interpreter python3
> +/usr/bin/ovs-vlan-test Not found the interpreter python3
> +/usr/bin/ovs-l3ping Not found the interpreter python3
> +/usr/bin/ovs-parse-backtrace Not found the interpreter python3
> +/usr/bin/ovs-dpctl-top Not found the interpreter python3
> +/usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
> +/usr/share/openvswitch/scripts/ovs-check-dead-ifs Not found the interpreter python3
> +/usr/share/openvswitch/scripts/ovs-monitor-ipsec Not found the interpreter python3
> +/usr/share/openvswitch/scripts/ovs-vtep Not found the interpreter python3
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 28e85d422..031bbf39c 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -154,7 +154,7 @@ SUFFIXES += .in
> + 	    -e 's,[@]PKIDIR[@],$(PKIDIR),g' \
> + 	    -e 's,[@]LOGDIR[@],$(LOGDIR),g' \
> + 	    -e 's,[@]DBDIR[@],$(DBDIR),g' \
> +-	    -e 's,[@]PYTHON3[@],$(PYTHON3),g' \
> ++	    -e 's,[@]PYTHON3[@],/usr/bin/env $(PYTHON3),g' \
> + 	    -e 's,[@]RUNDIR[@],$(RUNDIR),g' \
> + 	    -e 's,[@]VERSION[@],$(VERSION),g' \
> + 	    -e 's,[@]localstatedir[@],$(localstatedir),g' \
> +-- 
> +2.35.5
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 842ac11..9d3101a 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -26,6 +26,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-3.
>              file://disable_m4_check.patch \
>              file://systemd-update-tool-paths.patch \
>              file://systemd-create-runtime-dirs.patch \
> +            file://Makefile.am-set-the-python3-interpreter-with-usr-bin.patch \
>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8129): https://lists.yoctoproject.org/g/meta-virtualization/message/8129
> Mute This Topic: https://lists.yoctoproject.org/mt/100273524/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0374ECF648F
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:26:42 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20821.1763594795979491762
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=arvHvh6Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee44df7750so2276131cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594795; x=1764199595; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3HlVQDljKZXiY4XO5pNdzTeJaGyf1PFdnUNlAnE4Qc=;
        b=arvHvh6ZhaBE4S/9g8zutGuxy4o7HYAZTAlEEL38++RZrV8Uc9pM+9VDnvaxvbjFNT
         Lu68WuN1Czn12HBi9OHBUx02AzxsWFD+YeZHFXmQQ0KsU1UZHdUXvX2v7gQCiYMii9rA
         5CVDH7XWtTNSiuN87YdT//AveYjmr01oPMFZpWKTxV8l9wNiJxMh/bqyD0Sz0tsmheq7
         gasP6SNV2a1BTdK8n/1IDXzG0UBSZipNEDMZusLOpKbroVAcGyULkuN3bL7KxA+wwfvO
         xNqVIc8p728vY7nxKiy/Qr6JZxMI4A3WbfujIA9i/4nmP6YMgsNicmtmIa/NZVk8ikVu
         39zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594795; x=1764199595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3HlVQDljKZXiY4XO5pNdzTeJaGyf1PFdnUNlAnE4Qc=;
        b=sdcFlltdDuyBzDIFiSHVjdbBc/qGbbq2zQl18d0M/H+kyYjJ4P6/InSOzP9ijrkatt
         TKxnbVM3fw4w/9I0LWvyTw09shT/MHoAENKVMWTDMZks+K2/Zdy8c5/u3lFbkNUZJwsX
         MNJtrzsIJAYG9AgAma8LZzrU4AfVbFdpN+OfO9e9GfCU/FB+tFinu01c+70vc5MkfEL2
         jO7hGJWOjKF+QIBs2kI5NFpbzRJmKaNpvU0cbzViq8O8f9nfuwK3ChFgoynePhnM9zyC
         eSwC/LlIF0TiVWifU4Gvvoh1MkKVX17qxs6ofauIHZOe+wHx7J4ms8AcfqUys/IIC5Tw
         w4ag==
X-Gm-Message-State: AOJu0Yy5P06hQmM80apVu4DnO6eMjrACPVNWztKpSYBuwcfvsfuJ6iIA
	lEnWf6a5EXq6zCieZ2pDBxxKZ/oqHNkBNA0uVhOm87tnef6L2cJZ/YuWcyK0+GnF
X-Gm-Gg: ASbGncugVjaGGiTV+8OAq5S0HxuycYy3pA4c93si32Hc9nyTLRhCfpwqpGEv1MtHLYO
	R75DNtLMgSCmRcnGDecA9329qzIv314CfCD1RE2RcwkbF7fIuglUydh/7obOxGccMFxdwdemiE9
	+29Elb3Qdsk1s6FUA+44eSAveB+fHUAPyEgTUaK70atowY4VKPShLFVwe67U+JIzDO0ViUEOmwE
	DqSH/E+qYKymedUNCSR7tmRBjTBvCEVAdlJMWqB/98cSGCIeqrUxwfSUDEnHt2nzyUBOpyKcHbs
	wn/hxJp9PYTPnX5USiKxwb7hgIA3FIg/40vXue0r4kitXFmS02XwO443OZB7aLcXOqfkHN3JKxj
	3Rw7Gi3djgM6ErhRNiJTejc0yKi/MHUmnr2KhPqCOIsd5xtMbXUjPhmcf1F+9wPBW3UjtHVGcfc
	bWDXQkkomx6KBzpsV8ulEU/uQZyTq2qey5ZC7pNAgoUB4hJLYBxAW8SXNkn4F+aVIiI/3Nzwl+W
	+A=
X-Google-Smtp-Source: AGHT+IFCUMYXJE/djHzM6uuiQcD5sMtDNDWa95m7SXFJOXRpM95f2zHwtoT7Ef6VD552N7xuHhMS5w==
X-Received: by 2002:a05:622a:1aa0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4ee4b0d1543mr6466881cf.40.1763594794911;
        Wed, 19 Nov 2025 15:26:34 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d538f6sm5954531cf.10.2025.11.19.15.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:26:34 -0800 (PST)
Date: Wed, 19 Nov 2025 18:26:32 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hprajapati@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] kubernetes: Fix for
 CVE-2024-10220
Message-ID: <aR5SKBvzVYPt90D8@gmail.com>
References: <20251119085216.329343-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119085216.329343-1-hprajapati@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:26:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9446

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH] kubernetes: Fix for CVE-2024-10220
on 19/11/2025 Hitendra Prajapati via lists.yoctoproject.org wrote:

> Upstream-Status: Backport from https://github.com/kubernetes/kubernetes/commit/4b7b754099e32ce4b67dacd51d60daa2686ddd94
> 
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../kubernetes/CVE-2024-10220.patch           | 60 +++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
> new file mode 100644
> index 00000000..1de966e4
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
> @@ -0,0 +1,60 @@
> +From 4b7b754099e32ce4b67dacd51d60daa2686ddd94 Mon Sep 17 00:00:00 2001
> +From: Imre Rad <imrer@google.com>
> +Date: Thu, 25 Apr 2024 14:21:51 +0000
> +Subject: [PATCH] gitRepo volume: directory must be max 1 level deep
> +
> +More details on Hackerone #2266560
> +
> +CVE: CVE-2024-10220
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/4b7b754099e32ce4b67dacd51d60daa2686ddd94]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + pkg/volume/git_repo/git_repo.go      |  6 ++++++
> + pkg/volume/git_repo/git_repo_test.go | 14 ++++++++++++++
> + 2 files changed, 20 insertions(+)
> +
> +diff --git a/pkg/volume/git_repo/git_repo.go b/pkg/volume/git_repo/git_repo.go
> +index 995018d9007..b3827b92ad0 100644
> +--- a/pkg/volume/git_repo/git_repo.go
> ++++ b/pkg/volume/git_repo/git_repo.go
> +@@ -261,6 +261,12 @@ func validateVolume(src *v1.GitRepoVolumeSource) error {
> + 	if err := validateNonFlagArgument(src.Directory, "directory"); err != nil {
> + 		return err
> + 	}
> ++	if (src.Revision != "") && (src.Directory != "") {
> ++		cleanedDir := filepath.Clean(src.Directory)
> ++		if strings.Contains(cleanedDir, "/") || (strings.Contains(cleanedDir, "\\")) {
> ++			return fmt.Errorf("%q is not a valid directory, it must not contain a directory separator", src.Directory)
> ++		}
> ++	}
> + 	return nil
> + }
> + 
> +diff --git a/pkg/volume/git_repo/git_repo_test.go b/pkg/volume/git_repo/git_repo_test.go
> +index 5b1461be892..650f765cc48 100644
> +--- a/pkg/volume/git_repo/git_repo_test.go
> ++++ b/pkg/volume/git_repo/git_repo_test.go
> +@@ -267,6 +267,20 @@ func TestPlugin(t *testing.T) {
> + 			},
> + 			isExpectedFailure: true,
> + 		},
> ++		{
> ++			name: "invalid-revision-directory-combo",
> ++			vol: &v1.Volume{
> ++				Name: "vol1",
> ++				VolumeSource: v1.VolumeSource{
> ++					GitRepo: &v1.GitRepoVolumeSource{
> ++						Repository: gitURL,
> ++						Revision:   "main",
> ++						Directory:  "foo/bar",
> ++					},
> ++				},
> ++			},
> ++			isExpectedFailure: true,
> ++		},
> + 	}
> + 
> + 	for _, scenario := range scenarios {
> +-- 
> +2.50.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index ee44db47..5339371c 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -35,6 +35,7 @@ SRC_URI:append = " \
>             file://k8s-init \
>             file://99-kubernetes.conf \
>             file://CVE-2025-5187.patch \
> +           file://CVE-2024-10220.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.50.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9443): https://lists.yoctoproject.org/g/meta-virtualization/message/9443
> Mute This Topic: https://lists.yoctoproject.org/mt/116370883/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D6DCF6493
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:29:02 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20977.1763594939828157016
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JaTdXte+;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee328b8e38so2572331cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594939; x=1764199739; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bKthpHbgsRkceAEn8p/fkG0ivBLT7Qwh64bwL7BGWHg=;
        b=JaTdXte+mZHh84MMKlJbEQvRIW5YyxXKMdYObWOIztd2NfrLpka3/b3xDLbVFsnGIC
         tqgZPWvUkDPB5GC9xVqhulDGTA+7uG4UAaC1TvvBk6IDpE09iXV0i6KuZhAxcf7qEgwa
         MGuQ4BDGL84W3ssU9dWfid+42I4K5hDDL7E2nI/9twBBkQ0fe9Z2LN/9FtE5yng6DIzb
         ro84xuTiMvrJisejlhfv5sLLoJ8rUvJcc+QHBgsEMdIor/RSeFHj2xSt7vYAkNgA2DX3
         R6h7isVBayFnV45RC6G5HIQgQqzWIiRTkH6XQaBRRbIVkrJXBCFO/rZh/FGo6fqb2ygS
         Maug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594939; x=1764199739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKthpHbgsRkceAEn8p/fkG0ivBLT7Qwh64bwL7BGWHg=;
        b=NPtl6YBTVZUeTSzhaL+gKi99NIeA2j8N5g+1m+rxI0ZhW4OUhvKDPHq8sh+HLVKoPv
         Z6tkQkQKMBLHGtN8f/xMsvI+NCrI1ONuc2K2FwoH91feFAdHvD+uwx3+J7U2zstvCaEp
         MmOsMfxpTDwEP8vJaXiNWObBotStUKwKHlKMJ1YU2nrRF0EB0F+ywjr+wPv6tRJ8Cn9A
         u1d5sSlUElMiZmZZNE2UKNzNJohvISIulPDGN3dbTQ/a0VgG7ESIIugBg0AxOROAkQPz
         VpScCl8gyu+G+aG0fPYIHZrUsHSg4zh7kHg78esg+oRZ6/IL+MQE4+5v7rjvaIZG/7UF
         9bZQ==
X-Gm-Message-State: AOJu0YxivVkxLwq1tR1OBHDMXCbPfMaFdpINBBCcW3YhruvWkbenqCoA
	iiNaFq5ND4mokTHRRcs/48nMicQHuE9QeA1CQJOrRnywIeqEjqtwk7msfs2Bydkq
X-Gm-Gg: ASbGnctZzMsrcPWNGgNKArlCjsqbEbH+rilpwCLpItIWvgP4Lr7MAVbSYARWU0rUmGl
	D92ecSLe7yMDkYa6c9oyeItpQljYUwJxvuoHYTDby9Brg86DzITbP/cX4GrDMRokz2du0B1JGOE
	sbiRj01wf/mUeF+RM22sPrVPdZrOfHVCDs/XgNyr5NBqI5/mxU5Jg7D+8qV5VBfKj2pnSPsrgLm
	tBy5l/gRo/ugIZtruZ9aWAnnRdwDtboNUJ4eswTzqxPtwBcYu8aY/nAXWzd2CCDBDoyoqRetyM0
	p4QX9h699cp4PZ9Q4cXAOdr5daXGCESCWH6cOaUKpV4qF4tBrm2e/RtG2sHPAky3/uDoUeo7UGI
	edIkGj/CKLgpjGIysjIwULP3io7YwGRqxVUTiIpe/qoLp2EU9Fy/luNvPNleAMd1xCKmk8j9RCw
	UsJzrmBxaoUdhV8XAB+Nah50FifYKF/62z5N++nUt8sdkz7bGXbsSnBn3swoZHs4iY
X-Google-Smtp-Source: AGHT+IGahGLLFZdFZt+EuBm+xEq0LBqVGA4N0CQduTedGlB3lD2GfSLvvSEsac6gyYYX/RA/myUsIA==
X-Received: by 2002:a05:622a:112:b0:4ed:b134:38ea with SMTP id d75a77b69052e-4ee4a03ffdfmr10606161cf.41.1763594938748;
        Wed, 19 Nov 2025 15:28:58 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e90b62sm5714701cf.34.2025.11.19.15.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:28:57 -0800 (PST)
Date: Wed, 19 Nov 2025 18:28:55 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] kubernetes: Fix for
 CVE-2024-10220
Message-ID: <aR5St4rF083aHk0n@gmail.com>
References: <20251117050023.61262-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117050023.61262-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:29:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9449

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] kubernetes: Fix for CVE-2024-10220
on 17/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> Upstream-Status: Backport from https://github.com/kubernetes/kubernetes/commit/6622b002f70a153100d1c286fbcea721160da192
> 
> Reference: https://github.com/kubernetes/kubernetes/issues/128885
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../kubernetes/CVE-2024-10220.patch           | 57 +++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
> new file mode 100644
> index 00000000..c0e371af
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
> @@ -0,0 +1,57 @@
> +From 6622b002f70a153100d1c286fbcea721160da192 Mon Sep 17 00:00:00 2001
> +From: Imre Rad <imrer@google.com>
> +Date: Thu, 25 Apr 2024 14:21:51 +0000
> +Subject: [PATCH] gitRepo volume: directory must be max 1 level deep
> +
> +More details on Hackerone #2266560
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/6622b002f70a153100d1c286fbcea721160da192]
> +CVE: CVE-2024-10220
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/volume/git_repo/git_repo.go      |  6 ++++++
> + pkg/volume/git_repo/git_repo_test.go | 14 ++++++++++++++
> + 2 files changed, 20 insertions(+)
> +
> +diff --git a/pkg/volume/git_repo/git_repo.go b/pkg/volume/git_repo/git_repo.go
> +index 995018d900727..b3827b92ad0f0 100644
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
> +index 5b1461be892a1..650f765cc4884 100644
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
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 41f1ad73..dbfb3705 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -39,6 +39,7 @@ SRC_URI:append = " \
>             file://CVE-2023-3955.patch;patchdir=src/import \
>             file://CVE-2023-3676.patch;patchdir=src/import \
>             file://CVE-2025-5187.patch;patchdir=src/import \
> +           file://CVE-2024-10220.patch;patchdir=src/import \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9441): https://lists.yoctoproject.org/g/meta-virtualization/message/9441
> Mute This Topic: https://lists.yoctoproject.org/mt/116333305/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



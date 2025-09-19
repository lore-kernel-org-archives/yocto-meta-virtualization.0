Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7175CA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:41:13 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.6796.1758249671195406010
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 19:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c9Nykixl;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-80e2c52703bso162260985a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 19:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758249670; x=1758854470; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVdrkF2JcNykYz6rQ7MRibB1NsfGVuyRE3/v/FyLx8g=;
        b=c9NykixlQXHzmgLmk6RYzG1wH9VwqX9J1oXf3rkpFzKbrx6MUmndvvGWqiri0NvU5X
         dFrSJzQwNfVLni0JPXQYxRNmN6OK+2BqqPnwNZffHuKeOa+MUJVrhEk+eoWgdk1h9ZaV
         siTedwRYwJDGkrg2yH81hCmiI0ZdLXi/vvuZY+atXzhcuV13l71AYr2wgidt9DXLZwaw
         msYBHXvztBp9RsQVGWQ/QPoVcOw2/oetHtlY5yJkYRjHMbZAk16k6f1CxQu/afJMDWhb
         /1tS1fQFvAVwSKDP+OYaVoKL+CDSDKzXjlxLqfWcVsGHEJ6324GotIwZOQ/CutvbSWqV
         jmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758249670; x=1758854470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVdrkF2JcNykYz6rQ7MRibB1NsfGVuyRE3/v/FyLx8g=;
        b=jw8ONL1tUyR8VV+Va+lHR1OJ8g9cr/j4fNA7+5ll84YSlLAzXtL+D7N69rzY2QfzCm
         fjhX90T/TnwwdPy4BYNaIsbHBUaDtqbeUeULRev5bYhGXMxn7oOMBhOv0wJaH4+1DUAu
         HsnO3tGRQofptKWseY0C0e47mIs/XsBRPNL2m4Fgw40f74ZgiPlEq3xbHGOIiRMTc0Jd
         M969ZawDpVjevIM6Uh/E6ig1sDlpuc/baL6EPKyNYE6OVHK2X057Y4fh1lEPJe6sZyfF
         /tJkf85e3secGnq7X+CpsRYIET4/lh+TkCo840pm4WSqMi8WcvBu0k8PJwxaPqYIC4yz
         iMRA==
X-Gm-Message-State: AOJu0YwMT1DvWLIqcY4nMwIBQzJBphXCdrLOu29zUHS5lvNg1zicssZB
	bAnr8X5cr9io5ENKM1Q0LaB/hgAmxFmBtq0eB02GgRKn41AswBPwNmMn352mQEouLkY=
X-Gm-Gg: ASbGncvsqHVauHqMFF8j5wfcuzVvvN2bUu5H7UFgaPcg3sQ2PQsy57JhNi2m6vibO+7
	UEKR6RV76YNzEkdSHhmcxR5VFEdRLM7lF5K3Jj8XIzi1SqUh4AybnWqb8Fw0PV7j9AJP3gAFVJo
	6zhYEvtD0KqCLzByWVSM63H9LQsqbcqb2QBx/pGSoktsrnLlOfFzSPomD0iDhbDlLpsynP20b7w
	1kZvflEXnuXnUdMZ3sfMJPk0WWfHHvF9a6y1iG61QKpT9urW07h06iVeDaxMQUhGkCop55fyzFw
	TCRMhKJgzmjhnV0F+mkJ4RTMtePNkfTK7dq+9PpY+JF9Gg/U+jSs/0lz2z/d1xGH2enRq7Al6BC
	1PNmf5YjpdJZe10mWBMBT7T+bdS6d8LEmtqHXDAF/1HECenydwhW4/mZLXUUp1is3wTjfeweygk
	RYI3482Tiq3oTrRy4nIY0lQmHU367t7wgxPBAd8Umfo+JKFeExNJKIBnsn9BHXFQ==
X-Google-Smtp-Source: AGHT+IFiVFI1XRPIw95jIiG1no7MPtxWyOdQ55HD7Jsg8+LRpJ0Mnw/ZSzcMykTlDaIVRWpHkQ01hA==
X-Received: by 2002:a05:620a:172a:b0:82e:ceaf:1aaf with SMTP id af79cd13be357-83ba29b5d0dmr212798785a.11.1758249669942;
        Thu, 18 Sep 2025 19:41:09 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8361b486263sm272725185a.0.2025.09.18.19.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:41:09 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:41:07 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yogita.Urade@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix
 CVE-2024-9407
Message-ID: <aMzCwxyq0uVpLCz0@gmail.com>
References: <20250916052515.891345-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916052515.891345-1-yogita.urade@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 02:41:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9405

The same question needs to be answered for all of these CVE
patches (send a v2).

What release was the fix/commit introduced, and show that
you've checked to see if there's a release branch equivalent
for the version we are patching.

Version bumps (within the -stable branch policy of 3rd digit
or no major updates) are much preferred to patches.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix CVE-2024-9407
on 16/09/2025 Urade, Yogita via lists.yoctoproject.org wrote:

> From: Yogita Urade <yogita.urade@windriver.com>
> 
> A vulnerability exists in the bind-propagation option of the
> Dockerfile RUN --mount instruction. The system does not properly
> validate the input passed to this option, allowing users to pass
> arbitrary parameters to the mount instruction. This issue can be
> exploited to mount sensitive directories from the host into a
> container during the build process and, in some cases, modify the
> contents of those mounted files. Even if SELinux is used, this
> vulnerability can bypass its protection by allowing the source
> directory to be relabeled to give the container access to host files.
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-9407
> 
> Upstream patch:
> https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e
> 
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../podman/podman/CVE-2024-9407.patch         | 58 +++++++++++++++++++
>  recipes-containers/podman/podman_git.bb       |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 recipes-containers/podman/podman/CVE-2024-9407.patch
> 
> diff --git a/recipes-containers/podman/podman/CVE-2024-9407.patch b/recipes-containers/podman/podman/CVE-2024-9407.patch
> new file mode 100644
> index 00000000..397cd362
> --- /dev/null
> +++ b/recipes-containers/podman/podman/CVE-2024-9407.patch
> @@ -0,0 +1,58 @@
> +From 2b2c7a89586d0e495b6bc5cc5687bab79162118e Mon Sep 17 00:00:00 2001
> +From: Matt Heon <mheon@redhat.com>
> +Date: Tue, 1 Oct 2024 12:38:45 -0400
> +Subject: [PATCH] Validate the bind-propagation option to `--mount`
> +
> +Similar to github.com/containers/buildah/pull/5761 but not
> +security critical as Podman does not have an expectation that
> +mounts are scoped (the ability to write a --mount option is
> +already the ability to mount arbitrary content into the container
> +so sneaking arbitrary options into the mount doesn't have
> +security implications). Still, bad practice to let users inject
> +anything into the mount command line so let's not do that.
> +
> +Signed-off-by: Matt Heon <mheon@redhat.com>
> +
> +CVE: CVE-2024-9407
> +Upstream-Status: Backport [https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + pkg/specgenutil/volumes.go  | 6 ++++++
> + test/e2e/run_volume_test.go | 4 ++++
> + 2 files changed, 10 insertions(+)
> +
> +diff --git a/pkg/specgenutil/volumes.go b/pkg/specgenutil/volumes.go
> +index c481867163..5618b2d342 100644
> +--- a/pkg/specgenutil/volumes.go
> ++++ b/pkg/specgenutil/volumes.go
> +@@ -272,6 +272,12 @@ func parseMountOptions(mountType string, args []string) (*spec.Mount, error) {
> +			if !hasValue {
> +				return nil, fmt.Errorf("%v: %w", name, errOptionArg)
> +			}
> ++                        switch value {
> ++			case "shared", "rshared", "private", "rprivate", "slave", "rslave", "unbindable", "runbindable":
> ++				// Do nothing, sane value
> ++			default:
> ++				return nil, fmt.Errorf("invalid value %q", arg)
> ++			}
> +			mnt.Options = append(mnt.Options, value)
> +		case "consistency":
> +			// Often used on MACs and mistakenly on Linux platforms.
> +diff --git a/test/e2e/run_volume_test.go b/test/e2e/run_volume_test.go
> +index 4e777d62ef..5b256c9255 100644
> +--- a/test/e2e/run_volume_test.go
> ++++ b/test/e2e/run_volume_test.go
> +@@ -112,6 +112,10 @@ var _ = Describe("Podman run with volumes", func() {
> +		session.WaitWithDefaultTimeout()
> +		Expect(session).To(ExitWithError())
> +
> ++		session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=bind,src=/tmp,target=/tmp,bind-propagation=fake", ALPINE, "true"})
> ++		session.WaitWithDefaultTimeout()
> ++		Expect(session).To(ExitWithError())
> ++
> +		session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=tmpfs,target=/etc/ssl,notmpcopyup", ALPINE, "ls", "/etc/ssl"})
> +		session.WaitWithDefaultTimeout()
> +		Expect(session).Should(ExitCleanly())
> +--
> +2.40.0
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index ef9798f0..4086298f 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -24,6 +24,7 @@ SRC_URI = " \
>      file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
>      file://CVE-2025-6032.patch;patchdir=src/import \
>      file://CVE-2024-9341.patch;patchdir=src/import \
> +    file://CVE-2024-9407.patch;patchdir=src/import \
>  "
>  
>  LICENSE = "Apache-2.0"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9394): https://lists.yoctoproject.org/g/meta-virtualization/message/9394
> Mute This Topic: https://lists.yoctoproject.org/mt/115268579/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



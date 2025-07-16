Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3B9C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 18:50:08 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.30380.1752691802320994538
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 11:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMwM9aq4;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e169ac6009so15818985a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752691801; x=1753296601; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgEPxFDlh9rgleq6tjlsrRyMxuf4c2zGV6cJXKPbdLk=;
        b=OMwM9aq4qfzciKnFTNq+lr4iDmV9CLuWJKINUIB8y+mifiZuwSv5unuHDuXVkYCOyp
         bbguCvtJEuCwkoIX73xzhu9/VO9S1JMrIkCwm+qOVB4As9A7sQlx6gv9W3RWZfIZslWQ
         jjFg3MK/IDJ99+EoPqQKYbnKTC7OIDYJSE297PkST8M6OZSs0o1KEBwtqF8ULW+6Tc2s
         rIDPr4GscApX8Nb+SuK9XqHRIe2gojrkzozLJeAAqqJ0I1w1hbggTQFQnwC+27ryz0nG
         aUBCjQPE3wWoD1kIx8vuhBy8zvCwg0wBcUQjHQ3sptUaGzYu8Oz9xxyMOl9JQ+V9IZV2
         hR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752691801; x=1753296601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgEPxFDlh9rgleq6tjlsrRyMxuf4c2zGV6cJXKPbdLk=;
        b=mSPcP3sujk6otdcqN0mR4/chXiIEs3b1ydz6Kog9PQlOgtcG9g9D/ZZbnz2Onfcolo
         QLTfX2bZJHHXwphWTjDWC1g8QojK++Tc1+jgJw2FpcdxovGhDKyrV+ISHFp2/8nmU3c2
         QCBfTR6g4W2R0ZVAPGu0Y8dkWkAJAl995ay9fKU96UIDjNx1MP+INYNBVJl8/V+n1vas
         PMrB9V37S5yBPPPQBQxOcb+tiMNl4H4pQiIylqEzKcM9XH0+F4tW51eY4uLlVTJID/IR
         M74j5lz2MiXHmWgOqpiWlSe3qCPucb1Bm9tpNwIdcTehxQ2tL+S0kPjEiwG6eq06QByx
         nVjg==
X-Gm-Message-State: AOJu0YyBCMLUJIaIYq6j2WJe/83NuJMb6qlAc2rRGCNkUkSIf/zslxDD
	azgCjP6zDf4BRqeUNPfOKb5/v2VzF2Hr2w+XnHMpxnYjQccwKUxtaTdrstUcKUCc
X-Gm-Gg: ASbGncuTWusy8apqoGj4XPg0YNJgYTAyWVjXEZXS0iZT85u8KuYvKjSpq9NpTXUk0Op
	Ig0tDwibjD4yBBZKMyBjkyUhsGAbgl/hLGathpfEi7WkOLuDtSgnPH3S+JW5zpqOfS8/Wzz9on6
	1tKQpn4eNNWyBHvLvQAGETJpg7dhH3Q2A2S4stqHUt8ZvmrCO2zmRpXtdVunUxPUsi2y/rxgadN
	SUecCYFzT6BBxF9ruqwuMUDi3u3Hq/+F2DwgRNm9sRYH/gAw1O8DhoEK2iAvMGAe+zK18Vlnud1
	9lHC3snYStk1WP2kekrf8KTxDo3WKvvXuCMfaXx9DCoaWYV9+Z8A2M9u87AZcDFoo0uvLU6xu2m
	7OSVnHkXnQKirHEugXgQr7JTDhMLib3iMYYyC3WTaU3NZ8AKJO00XG3IduM/2i4UD1Q9Gjii9sa
	ib
X-Google-Smtp-Source: AGHT+IHV75rIGMURxgoxaRyft6pVSTfuU254Lk4Aiuygz2Sv9j3scK+YaR06QBktcOP0JuYw9uQ1Pg==
X-Received: by 2002:a05:620a:8806:b0:7e3:3650:23b4 with SMTP id af79cd13be357-7e343614312mr558755385a.40.1752691801127;
        Wed, 16 Jul 2025 11:50:01 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3452236besm113557485a.51.2025.07.16.11.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:50:00 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:49:58 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: archana.polampalli@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] cri-o: fix
 CVE-2023-6476
Message-ID: <aHf0VmCBDvbABia0@gmail.com>
References: <20250711113722.3012181-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711113722.3012181-1-archana.polampalli@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 18:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9314


In message: [meta-virtualization][kirkstone][PATCH 1/1] cri-o: fix CVE-2023-6476
on 11/07/2025 Polampalli, Archana via lists.yoctoproject.org wrote:

> From: Archana Polampalli <archana.polampalli@windriver.com>
> 
> A flaw was found in CRI-O that involves an experimental annotation leading to a
> container being unconfined. This may allow a pod to specify and get any amount
> of memory/cpu, circumventing the kubernetes scheduler and potentially resulting
> in a denial of service in the node.

merged.

Bruce

> 
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb         |  1 +
>  .../cri-o/files/CVE-2023-6476.patch           | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 recipes-containers/cri-o/files/CVE-2023-6476.patch
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 429c49a7..1e8353f8 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -20,6 +20,7 @@ SRC_URI = "\
>  	file://0001-Makefile-force-symlinks.patch \
>          file://crio.conf \
>          file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
> +        file://CVE-2023-6476.patch;patchdir=src/import \
>  	"
>  
>  # Apache-2.0 for docker
> diff --git a/recipes-containers/cri-o/files/CVE-2023-6476.patch b/recipes-containers/cri-o/files/CVE-2023-6476.patch
> new file mode 100644
> index 00000000..baa3bb54
> --- /dev/null
> +++ b/recipes-containers/cri-o/files/CVE-2023-6476.patch
> @@ -0,0 +1,61 @@
> +From 5faee5d82556a6bf4dd1144d2a86e70d097ab200 Mon Sep 17 00:00:00 2001
> +From: Peter Hunt <pehunt@redhat.com>
> +Date: Thu, 7 Dec 2023 16:07:12 -0500
> +Subject: [PATCH] allowed annotations: correctly filter prefixed annotations
> +
> +without this fix, a pod is able to gain access to experimental annotations that are prefixes of container names.
> +The most problematic of these is io.kubernetes.cri-o.UnifiedCgroup, which allows a user to arbitrarily
> +change the resources of the pod, potentially leading to OOM.
> +
> +Fixes CVE-2023-6476
> +
> +Signed-off-by: Peter Hunt <pehunt@redhat.com>
> +
> +CVE: CVE-2023-6476
> +
> +Upstream-Status: Backport [https://github.com/cri-o/cri-o/commit/5faee5d82556a6bf4dd1144d2a86e70d097ab200]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + pkg/config/workloads.go |  2 +-
> + test/workloads.bats     | 15 +++++++++++++++
> + 2 files changed, 16 insertions(+), 1 deletion(-)
> +
> +diff --git a/pkg/config/workloads.go b/pkg/config/workloads.go
> +index d5eeaf1ef..37a22fe76 100644
> +--- a/pkg/config/workloads.go
> ++++ b/pkg/config/workloads.go
> +@@ -102,7 +102,7 @@ func (w Workloads) FilterDisallowedAnnotations(allowed []string, toFilter map[st
> +	for ann := range toFilter {
> +		for _, d := range disallowed {
> +			if strings.HasPrefix(ann, d) {
> +-				delete(toFilter, d)
> ++				delete(toFilter, ann)
> +			}
> +		}
> +	}
> +diff --git a/test/workloads.bats b/test/workloads.bats
> +index 6102d6326..0f4d6e4f0 100644
> +--- a/test/workloads.bats
> ++++ b/test/workloads.bats
> +@@ -327,3 +327,18 @@ function check_conmon_fields() {
> +	df=$(crictl exec --sync "$ctr_id" df | grep /dev/shm)
> +	[[ "$df" == *'16384'* ]]
> + }
> ++
> ++@test "test workload pod should not be set if annotation not specified even if prefix" {
> ++	start_crio
> ++
> ++	jq '   .annotations["io.kubernetes.cri-o.UnifiedCgroup.podsandbox-sleep"] = "memory.max=4294967296" |
> ++	  .labels["io.kubernetes.container.name"] = "podsandbox-sleep"' \
> ++	"$TESTDATA"/sandbox_config.json > "$sboxconfig"
> ++
> ++	jq '   .annotations["io.kubernetes.cri-o.UnifiedCgroup.podsandbox-sleep"] = "memory.max=4294967296" |
> ++	  .labels["io.kubernetes.container.name"] = "podsandbox-sleep"' \
> ++	"$TESTDATA"/container_sleep.json > "$ctrconfig"
> ++
> ++	ctr_id=$(crictl run "$ctrconfig" "$sboxconfig")
> ++	[[ $(crictl exec "$ctr_id" cat /sys/fs/cgroup/memory.max) != 4294967296 ]]
> ++}
> +--
> +2.40.0
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9306): https://lists.yoctoproject.org/g/meta-virtualization/message/9306
> Mute This Topic: https://lists.yoctoproject.org/mt/114098577/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



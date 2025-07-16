Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63588C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 18:50:58 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.30403.1752691850661565574
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 11:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQJHkQRx;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7dd8773f9d9so13832885a.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752691850; x=1753296650; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiAP+O/lU5lAQKiZofrYfYWoloBX8W0g7Fn7Ex7WtRU=;
        b=KQJHkQRxI/uxD2lhGtyA8jhmkw6g4GbxBexUKkk98Er36e0OIHJbc2ZgcKw0u5vpSE
         Qz6TE3iLoGMcYKbEA8Kk1bnaV9F6TMjw9FTdbv0UaF7hhLVzqFiyfxCgZ8cOZszh0U/3
         lw3hvgCarB3zVyhMlJ8/cnP8wo2LA39HUpMRVpMm9Cj4dot4lBIJ2Mo3nj/neA1DOtMV
         /Fxjn4uKL5tFEfa2LxjYJaeJ2AC0cFwb6AkpUsoiJ1UF0dxEhMnFP1/XUnvV++FCRdKl
         fdU7oJKhl0ROogbsJIdKU/skyciqlMGqB34UA507t/vcNlEKq4e4sTf+3Ta4MW0Bld72
         gBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752691850; x=1753296650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiAP+O/lU5lAQKiZofrYfYWoloBX8W0g7Fn7Ex7WtRU=;
        b=mon0FRDi27TBOaj09imfHa7ZXoQhz+n/XlQCtEyoslR8xzxKxRSPCciJ7OguLHELtP
         hbpxZhqGT0zacSVrJeKRqx+O8uzX9Bj8vGeiIgUGwhtKF1qDoEpj7fV0nXImLtskHcPi
         dT6hkxlpbKZX5FpBWuTVRXONAzGtjQDRsWZUNRUOD3kAlCjEjofzdnaV53TN8x8CCpf2
         2Fw0K4ilKqZWJBKH+fiHNyHFP/nj0O/oyLtCDW/65svaBrSj6OiziA+XPTF+FyotFYBX
         fBbUqC3jzcZiTNI+tERL7S1GsFM6LpS2CKNmiprlCDz+nD1vxArfUdoEKnsf+J0+C7Yr
         YzXw==
X-Gm-Message-State: AOJu0Yz1ue7DHBb4bWZmcIkNRplM22rAEa/6v3MkX6XSCz6EgF2UFqov
	sNyVpf/ElCZf+ZRo4OJ2yWtt5+Ghdtwkh/C8mfusGjmEH6VIuGPURL948ckQHo8p
X-Gm-Gg: ASbGncvcdeua1zmEHXo4aP5AKDY2Uif6nQVpgAX8rA0zh9knyJJLueCQwiyPCMGnQ5y
	DXsA0GH4SfZCXVHC+5EZyjL7ONEc42tZRBPuLuI4HZ3KCjdTwa+Aer5/EBHn/OXxVTt9Zk4AHUl
	iZrMsq0V6dasrr6I+SfvDvYRYBtqN0PhiSigdRClHdeX/iPzgpnXu+LYq1SrJBUjn47yUYVSJF3
	xeJDFKtipZUmd0g2gpskLyVC6F/F9Snzytwiyc05Tuxvgqj0hTaRHFdU0pd0egsyCQYfq5qUq6c
	14cQlQxSDL3wOG8jer4unGtTV3gBw+WAbIazdOWeKbbAfwUlJDGYB17iuCP0yby5ePtzI3ckZ4M
	HnfUMm3Aohj8ARIcdQGPB+foIJtaaA7blz6o33Czkrd+AABQOoj3hO6sgGsLD4z/kroBSF0i0ub
	R8
X-Google-Smtp-Source: AGHT+IGp2+xmiD381kPJ8zNeJJ4nu5ZfofvuCjU669ni3tWkO+IIPo0k6+am4f0zBLzSji6CFLvGDg==
X-Received: by 2002:a05:620a:618c:b0:7e2:2683:567b with SMTP id af79cd13be357-7e342b4406bmr603708285a.30.1752691849315;
        Wed, 16 Jul 2025 11:50:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3463a4bbbsm101867685a.91.2025.07.16.11.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:50:48 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:50:47 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: soumya.sambu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][walnascar][PATCH 1/1] kubernetes: Upgrade
 to 1.32.6
Message-ID: <aHf0h41sAA2FB1TB@gmail.com>
References: <20250711103740.3168268-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711103740.3168268-1-soumya.sambu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 18:50:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9315

merged.

Bruce

In message: [meta-virtualization][walnascar][PATCH 1/1] kubernetes: Upgrade to 1.32.6
on 11/07/2025 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> Bumping kubernetes to version v1.32.6, which comprises the following commits:
> 
>     036f7ed3f1f Release commit for Kubernetes v1.32.6
>     66b2951498a Merge pull request #132225 from cpanato/update-go-1-32
>     7246ec90c1b Bump images, dependencies and versions to go 1.23.10 and distroless iptables
>     2aa6d7d4674 Merge pull request #131782 from rata/automated-cherry-pick-of-#131623-upstream-release-1.32
>     5b3e813641d Merge pull request #132099 from gnufied/automated-cherry-pick-of-#131408-upstream-release-1.32
>     09750267c3b Merge pull request #132010 from gnufied/automated-cherry-pick-of-#131987-upstream-release-1.32
>     6471cec0de5 Merge pull request #131784 from rata/automated-cherry-pick-of-#130243-upstream-release-1.32
>     790dc3b4fa5 Merge pull request #131652 from princepereira/automated-cherry-pick-of-#131506-upstream-release-1.32
>     b41aa671242 Merge pull request #131786 from rata/automated-cherry-pick-of-#130800-upstream-release-1.32
>     448eedf8efd Merge pull request #131875 from pohly/automated-cherry-pick-of-#131844-origin-release-1.32
>     de8292ad6f1 Remove warning about resizing failed for unknown reason
>     ec4c71b7055 Add tests that validate the return value of resize operation
>     89d95c9713a Merge pull request #131936 from cpanato/update-go-1.32
>     40849d37eae Bump images, dependencies and versions to go 1.23.9 and distroless iptables
>     9a67ee4a707 DRA node: reject static pods which reference ResourceClaims
>     07011c05b71 pkg/kubelet/userns: Remove skip on windows
>     1d923fbc781 pkg/kubelet/userns: Wrap error to get mappings
>     3755f8e2f28 pkg/kubelet/userns: Provide stub implementation for windows
>     b5d6f06fe6e pkg/kubelet: Fix userns tests on Windows
>     5e7201df697 Revert "Enforce the Minimum Kernel Version 6.3 for UserNamespacesSupport feature"
>     a35311c3588 Revert "Switch hard error to a WARNING for kernel version check"
>     54889f05324 userns: Wrap more errors
>     9326fc30973 userns: Improve error returned if userns is not supported
>     fd5862185f2 userns: Use len to handle empty non-nil slices
>     95c119b504e Update CHANGELOG/CHANGELOG-1.32.md for v1.32.5
>     9894294ef13 (tag: v1.32.5) Release commit for Kubernetes v1.32.5
>     3f75cae6030 Merge pull request #131524 from carlory/automated-cherry-pick-of-#131495-release-1.32
>     55a2f43a98f Merge pull request #131438 from gnufied/automated-cherry-pick-of-#131418-upstream-release-1.32
>     01aff800b63 Merge pull request #131528 from ameukam/update-go-1-23-8
>     9a57de0ec6f Update hnslib version in Windows KubeProxy.
>     a624d76abdf Merge pull request #131428 from princepereira/automated-cherry-pick-of-#131138-upstream-release-1.32
>     7ba97788a71 Bump images, dependencies and versions
>     5ad726c6ef3 Handle unsupported node expansion for RWX volumes
>     b23e637969f Manually adding fix for failing pull-kubernetes-typecheck tests which had dependency with this commit: https://github.com/kubernetes/kubernetes/commit/61863035803cc105619925a0fa23a779a9578bd4
>     cdbea02d39f Mark NodeExpansion finsihed without featuregate check
>     69e0af31000 Also change final status by removing featuregate check
>     0bec23c9577 Check for newer fields when deciding expansion recovery feature status
>     76bf5dbdc88 Fix for HNS local endpoint was being deleted instead of the remote endpoint.
>     d5df907c3cb Update CHANGELOG/CHANGELOG-1.32.md for v1.32.4
>     59526cd4867 (tag: v1.32.4) Release commit for Kubernetes v1.32.4
>     bf1fded1f95 Merge pull request #130773 from JoelSpeed/automated-cherry-pick-of-#130450-kubernetes-release-1.32
>     0b7ab453ce6 Merge pull request #130684 from carlory/automated-cherry-pick-of-#130335-upstream-release-1.32
>     35716897a3d Merge pull request #131159 from wojtek-t/automated-cherry-pick-of-#131020-upstream-release-1.32
>     7b326a95116 Fix race for sending errors in watch
>     cdc807a9e84 Merge pull request #131154 from neolit123/automated-cherry-pick-of-#131153-origin-release-1.32
>     b5f6d82ff5d CHANGELOG-1.32: fix release note about kubeadm upgrade phases
>     01b87d211f1 Fix implementation of ContainsCIDR to allow non-equal addresses
>     a0ad8fb28a4 Update CHANGELOG/CHANGELOG-1.32.md for v1.32.3
>     32cc146f75a (tag: v1.32.3) Release commit for Kubernetes v1.32.3
>     e3daed87346 fix handle terminating pvc when kubelet rebuild dsw
>     ef4a6f98333 fix e2e
>     ad0c8a10e4e add e2e test to reproduce unexpected unmount after kubelet is restarted
>     1b7bbcf2f55 Merge pull request #130508 from cici37/automated-cherry-pick-of-#130035-upstream-release-1.32
>     b6fd7487faa Update status before returning err
>     d2dbce82b9e Merge pull request #130563 from bitoku/automated-cherry-pick-of-#130097-upstream-release-1.32
>     b245ae997ee Merge pull request #130496 from sreeram-venkitesh/automated-cherry-pick-of-#129946-upstream-release-1.32
>     d18b6d9d681 Merge pull request #130461 from kariya-mitsuru/automated-cherry-pick-of-#130405-upstream-release-1.32
>     e6a89a28f38 Merge pull request #130313 from neolit123/automated-cherry-pick-of-#130202-origin-release-1.32
>     31c7235f4c5 Modify how to check the status
>     8636d1b4272 Add the feature gate `OrderedNamespaceDeletion` for apiserver.
>     8516520fffa Merge pull request #130109 from varad-ahirwadkar/automated-cherry-pick-of-#129114-upstream-release-1.32
>     8207fb465f2 Merge pull request #129690 from pohly/automated-cherry-pick-of-#129661-origin-release-1.32
>     b0554e32c76 Merge pull request #130505 from aojea/automated-cherry-pick-of-#130484-upstream-release-1.32
>     2a60692f5b6 conntrack reconciler must check the dst port
>     642b0eae3dd fix(pod/util): typos in getting pod validation options
>     dbf78217a10 Add Additional Tests
>     1d3fafa1c7e Fix typo
>     7826934ada9 Add ControllerRoles Test
>     019c9b4d2dd Fix Fixture Data
>     549220b61ec Add Watch to controller roles
>     0821aa23081 Merge pull request #130165 from mimowo/automated-cherry-pick-of-#130164-upstream-release-1.32
>     403f0ce511b Merge pull request #130070 from mimowo/automated-cherry-pick-of-#130068-upstream-release-1.32
>     85ff7928f46 Merge pull request #130356 from aojea/automated-cherry-pick-of-#130348-upstream-release-1.32
>     53a53b7f62c Merge pull request #130392 from mrIncompetent/automated-cherry-pick-of-#129307-upstream-release-1.32
>     f0100b2b68e Merge pull request #130136 from AwesomePatrol/automated-cherry-pick-of-#130113-upstream-release-1.32
>     ea73dad5498 Merge pull request #130332 from richabanker/automated-cherry-pick-of-#129996-upstream-release-1.32
>     1c07a398470 fix copyright year
>     849aa0858f3 Generate register files for all examples
>     6ad91995281 add simpletype pkg in v1 for register-gen test
>     5fa72a8c1db Add codegen::register to hack/update-codegen.sh
>     c05e46c1630 Add missing imports in register-gen
>     4c2a0b85f89 Revert "Add random interval to nodeStatusReport interval every time after an actual node status change"
>     99eedea5cca Remove the feature-gate check before populating serverRunOptions.Flagz
>     a0eb3acf30e test: Add emulated-version flag verification in flagz test
>     8b3a93b843e fix: flagz endpoint to return parsed flags value
>     412c353d05b kubeadm: fix panic when no UpgradeConfiguration was found in the config file
>     dce86010a0f Merge pull request #130034 from aroradaman/automated-cherry-pick-of-#130032-upstream-release-1.32
>     fdf6d464bf0 Merge pull request #130253 from fuweid/1.32-backport-130126
>     f5fc57e1ee8 proxy: should add PingPeriod for websocket translator
>     0126bb57a8f Merge pull request #130175 from liggitt/go-tools-132
>     1f27b75275d Honor KUBE_HACK_TOOLS_GOTOOLCHAIN
>     00f135bb643 Deflake the PodReplacementPolicyFeatureToggling Job integration test
>     1ac9e213a8d Limit ResourceQuota LIST requests to times when informer is not synced
>     ac28939fdd6 Update CHANGELOG/CHANGELOG-1.32.md for v1.32.2
>     67a30c0adcf (tag: v1.32.2) Release commit for Kubernetes v1.32.2
>     d428c6b8fe6 kubelet: fix DRA registration test
>     5841717525c Merge pull request #130078 from cpanato/update-go-132
>     ae0ec29cbf4 Bump images, dependencies and versions to go 1.23.6 and distroless iptables
>     d589f566578 Fix the flaky Job test: TestSuccessPolicy_ReEnabling
>     393ffc7d26d Merge pull request #129966 from cpanato/update-go-rel132
>     f0022d37526 bump netlink
>     80fb77ad8e4 Merge pull request #130015 from aramase/aramase/f/disable_serviceaccountnodeaudiencerestriction_1.32
>     b53c36d3273 Merge pull request #130010 from tallclair/automated-cherry-pick-of-#129739-upstream-release-1.32
>     953ac56c211 Disable ServiceAccountNodeAudienceRestriction feature gate by default in v1.32
>     302fab74111 Kubelet server handler cleanup
>     33ca8812233 Merge pull request #129928 from mimowo/fix-job-int-test-1.32
>     fa68823677f Bump images, dependencies and versions to go 1.23.5 and distroless iptables
>     45b2f1c2008 Fix the remaining flaky integration tests in Job controller
>     9d0179ee11d WIP: fix the flaky Job integration tests
>     faf35b4eac9 Merge pull request #129862 from neolit123/automated-cherry-pick-of-#129859-origin-release-1.32
>     5cc748f3242 kubeadm: use the v1beta4 EtcdAPICall timeout for etcd calls
>     dac2e30a730 Merge pull request #129627 from gnufied/automated-cherry-pick-of-#129618-upstream-release-1.32
>     ad81b22354c Merge pull request #129743 from pjsharath28/automated-cherry-pick-of-#128997-upstream-release-1.32
>     ce39aed39ed Merge pull request #129740 from bobsongplus/automated-cherry-pick-of-#129629-upstream-release-1.32
>     4ac02cbbbd9 Merge pull request #129608 from neolit123/automated-cherry-pick-of-#129594-origin-release-1.32
>     00faa5e7ae9 DRA CEL: skip estimating the cost in the scheduler
>     5648b9caa81 Merge pull request #129782 from pohly/apidiff-release-1.32
>     9ade604a07a hack: backport apidiff.sh
>     11c3bd3038d Fix: touch /dev/null permission denied on macos
>     643951a9622 Merge pull request #129674 from gohilankit/automated-cherry-pick-of-#129630-upstream-release-1.32
>     4e43ab095e8 Added check for multipath device mapper
>     f89e4c08cfe DRA CEL: add missing size estimator
>     051414a53a0 Fix Portworx plugin's CSI translation to copy secret name & namespace
>     6473e7b6cae Update CHANGELOG/CHANGELOG-1.32.md for v1.32.1
>     e9c9be4007d (tag: v1.32.1) Release commit for Kubernetes v1.32.1
>     0bf3f03dda7 We still can't rely on first condition being fs-expansion pending condition
>     570f5501897 Bump CSI sidecars to fix CI issues and such
> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index b6eb4946..183ba7fd 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,9 +5,9 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>  
> -PV = "v1.32.0+git"
> -CVE_VERSION = "1.32.0"
> -SRCREV_kubernetes = "5fe148234f8ab1184f26069c4f7bef6c37efe347"
> +PV = "v1.32.6+git"
> +CVE_VERSION = "1.32.6"
> +SRCREV_kubernetes = "036f7ed3f1f4a2d97a654269a98ad7be7d460db6"
>  SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
>  PE = "1"
>  
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9305): https://lists.yoctoproject.org/g/meta-virtualization/message/9305
> Mute This Topic: https://lists.yoctoproject.org/mt/114098124/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



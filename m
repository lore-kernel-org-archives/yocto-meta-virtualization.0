Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0D9C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:07:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.29580.1644426417917624147
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A3vJ1orp;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id ka4so9133009ejc.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tsTKHn98qWpgxIi/bXnO8BncLObu8V4nXADGZ/Mtej8=;
        b=A3vJ1orpVWJqGl1VO0uscGwHzTqH86XsjShuvaElEHs87N3yh3HFHNAaoEzj5A4dN8
         +68H9kKxCZsN8sY9oQpaeahQdKkm9GziGs4B6aB/Yc2OQ+GRsqAo6xuOLMhF1Myub/VH
         rMBpwZCS7OO7MeAflFvTN3rPLCf7vczTOsRDOOjFSdfTO6F4yh2jVmdg0JNaPk3gNEbl
         1hPRRH2HrB7xOiQZQnZoRoPGLrKKd74v0rXRBQEagHELH6RvaYZqpIGha9i1nnz5Fs2R
         NxPeLgO3ukPsgpgCm7WH3v+RVe39FNZMtMd8xPoaCMIuil6ggK58fYLWfzbUZzeDBJpf
         I7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsTKHn98qWpgxIi/bXnO8BncLObu8V4nXADGZ/Mtej8=;
        b=NnuidIviOaMZXiDuYXNJpl8GrRTUOLxkAsBFtIy4PZvz4hJq+A8/jLQIwCe2mpdoDP
         EzMzNpP7c0FAdYFVtnW3mEDk/VzqN1uZaq/yfztVO6Y0N1Rj3zAlesYv7wHMW6iibtNt
         WX6PJo3kqougD6yREzxSGP5A6lUyPh3ouZoPIDdfwwHPlaQkUtt35BvbjO4cE80fl3IK
         jieftV9lu2SWL1xAkXYcem4eYKZob3OtO52TW1B291ZRqi1bxrVm38mzaRmSWi7q2xNa
         Jc3USBjlznzSyi+HG7hIwKulbirPcTpFzkfz4cg1lTBr4QmzOgBV0NNcJNPHrqhELyN+
         7R7w==
X-Gm-Message-State: AOAM5333KA4C0fRYwuIkS4V2F1JskknLSmUVMWnHwpAbDSOE1/6zoBTI
	flyQvlS1WtgqnFEvtnIPwJkLVoXfEckXKS52Qe0=
X-Google-Smtp-Source: 
 ABdhPJy2WECeBtsZZSr8sodSW50UY1mTZO4HC7v1OgDlxbZvR+nSMhG8VvmcNkYEhvsoi5VuLbqZQ1THLHsTxlqEJas=
X-Received: by 2002:a17:906:15ca:: with SMTP id
 l10mr2940601ejd.435.1644426415846;
 Wed, 09 Feb 2022 09:06:55 -0800 (PST)
MIME-Version: 1.0
References: 
 <418a985b65f8fe5aa5d2728586d0bea68bc7181c.1644420463.git.diego.sueiro@arm.com>
In-Reply-To: 
 <418a985b65f8fe5aa5d2728586d0bea68bc7181c.1644420463.git.diego.sueiro@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Feb 2022 12:06:44 -0500
Message-ID: 
 <CADkTA4NTHfQDJNmrb0AbNGLHa0OZ3Ske4J43BDtscQ=R+bvKrA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH honister] k3s: uprev from
 v1.21.5+k3s1 to v1.21.9+k3s1
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:07:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7055

On Wed, Feb 9, 2022 at 10:32 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Also fix build issues related to:
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | go: inconsistent vendoring in /[...]/build/tmp/work/aarch64-poky-linux/k3s/v1.21.9+k3s1-r0/k3s-v1.21.9+k3s1/src/import:
> |       github.com/containerd/cgroups@v1.0.1: is explicitly required in go.mod, but not marked as explicit in vendor/modules.txt
> |       github.com/containerd/containerd@v1.5.7: is explicitly required in go.mod, but not marked as explicit in vendor/modules.txt
> |       github.com/containerd/cri@v1.11.1-0.20200820101445-b0cc07999aa5: is explicitly required in go.mod, but not marked as explicit in vendor/modules.txt
> |...
> |       mvdan.cc/unparam: is replaced in go.mod, but not marked as replaced in vendor/modules.txt
>
> Short log since v1.21.5+k3s1:
> 101917b0c4 (tag: v1.21.9-rc1+k3s1, tag: v1.21.9+k3s1) Update to v1.21.9 (#4994)
> 8069a88177 Merge pull request #4978 from manuelbuil/ip6tables-release121
> dc970d27ca Merge pull request #4982 from rbrtbnfgl/ipv6-nat_release-1.21
> 447279299b go generate
> 00068c92ea Fix CRD version lookup
> 683efbb737 Update packaged components
> f856aa94d6 Upgrade: metrics server version bump from v0.5.0 to v0.5.2
> 900e5ff519 [Release-1.21] Adds the ability to compress etcd snapshots (#4866) (#4959)
> 42d160da5b Move flannel logs to logrus
> de12630ec0 Added debug log for IPv6 Masquerading rule
> bb3fe9b185 Added flannel-ipv6-masq flag to enable IPv6 nat
> bfafe909d1 Remove ip6table rules when cleaning up k3s
> 758331404e Added iptables masquerade rules for ipv6 on flannel
> f540db4570 Update etcd to v3.4.18-k3s1
> 6644357d0e Skip CGroup v2 evac when agent is disabled
> f11f0748e9 Enable logging on all subcommands (#4921) (#4932)
> be3c430985 (tag: v1.21.8-rc2+k3s2, tag: v1.21.8+k3s2) Move ClusterResetRestore handling ControlConfig setup
> c25ffa9ea3 (tag: v1.21.8-rc1+k3s2) Add basic etcd join test
> a0521c29eb Fix handling of agent-token fallback to token
> 4b3f5be45d Fix use of agent creds for secrets-encrypt and config validate
> 512268458e Merge pull request #4842 from luthermonson/rm-vendor-121
> 03aa6d568f drop vendor dir
> 1942d18447 code to remove vendor dir
> d47e38e05e Add etcd sonobuoy tests
> 9df916e86d Add variable to enforce max test concurrency
> 58501554f3 Fix previous channel detection
> 8b4553c921 More codespell ignores
> 625dd61a60 Close etcd clients to avoid leaking GRPC connections
> 14364119f6 Build script cleanups
> b39c805d52 Bump k3s-root to v0.10.1
> 5641f9b328 Fix panic checking name of uninitialized etcd member
> 046961c4c6 Update bootstrap logic to output all changed files on disk (#4800) (#4808)
> 7e9ac115f4 [Release-1.21] Close agentReady channel only in k3s (#4794)
> cbff7350ec (tag: v1.21.8-rc2+k3s1, tag: v1.21.8+k3s1) Merge pull request #4778 from manuelbuil/fix-rke2-ha-121
> 8d2170f5c4 Remove Disables, Skips and DisableKubeProxy from the comparing configs
> 78102dcc01 (tag: v1.21.8-rc1+k3s1) Update to v1.21.8 (#4760)
> 6bac01fc58 [Release-1.21] Fix cold boot and reconcilation on secondary servers (#4753)
> 5260e4a649 (tag: v1.21.7-rc2+k3s2) Merge pull request #4734 from briandowns/backport_issue-4644-release-1.21
> 0d065c8491 Fix snapshot restoration on fresh nodes (#4737)
> 98d6d38d61 Resolve Bootstrap Migration Edge Case (#4730)
> 53ef842a98 (tag: v1.21.7-rc1+k3s2) Resolve restore bootstrap (#4704) (#4716)
> d2f0bbb381 Bump runc to v1.0.3
> 3024462196 Add validation to certificate rotation (#4697)
> 8e1b2340c9 Bump wharfie to v0.5.1 and use shared decompression code
> f468e10fcf bump kine to v0.6.5
> b526e98d1b Include node-external-ip in serving-kubelet.crt SANs (#4620)
> 1e67a2b004 Merge pull request #4679 from manuelbuil/ha-verify-1.21
> 8ea26cdad1 Check HA network parameters
> 1055837e4f Backport secrets-encrypte command (#4658)
> 7b62900836 [Release-1.21] Add cert rotation command (#4632)
> 378201a459 Merge pull request #4616 from manuelbuil/loggingFlannel1.21
> 1390792919 Improve flannel logging
> a622dd57f3 [release-1.21] etcd snapshot functionality enhancements (#4606)
> ac70570999 (tag: v1.21.7-rc2+k3s1, tag: v1.21.7+k3s1) go generate
> 3f40742363 Add package version to traefik helm chart
> d09821c2ed (tag: v1.21.7-rc1+k3s1) [release-1.21] Bump golang and containerd versions (#4539)
> 7f737097bc [release-1.21] Bump Kubernetes to v1.21.7-k3s1 (#4531)
> 1847a711e7 Fix regression with cluster reset (#4524)
> 5b456972c3 Merge pull request #4519 from manuelbuil/backport_ipv6_rh_121
> fd71ed9f4a Allow svclb pod to enable ipv6 forwarding
> c096668cde Merge pull request #4515 from manuelbuil/fix_dualStack
> 43e15c4028 Backport updating cniplugins version and klipper-lb images
> 256f5d504a Merge pull request #4513 from manuelbuil/backport_dual-stack
> 88e77fdbfd Improved regex for double equals arguments (#4508)
> e777b2c767 Dual-stack support LB controller
> 6854470a14 Merge pull request #4503 from manuelbuil/fix_dualStack_bug
> 7de34a0059 Fix bug in dual-stack
> 93cf545ab2 [Release-1.21] Removed warning about skipping flags (#4493)
> 119b1aeb25 [Release-1.21] etcd-snapshot loading config fails with "flag provided but not defined" (#4482)
> 334eae119a [release-1.21] Add etcd extra args support for K3s (#4471)
> 10c854c00e Increase agent's apiserver ready timeout (#4457)
> c9d4543c99 go generate
> 7d5d1dbb80 Add dashboard annotations to Traefik helm chart
> 864e800896 [Release-1.21] All bootstrap backport (#4452)
> df033fa248 (tag: v1.21.6-rc3+k3s1, tag: v1.21.6+k3s1) Fix log/reap reexec
> 254d2f696e (tag: v1.21.6-rc2+k3s1) Fix other uses of NewForConfigOrDie in contexts where we could return err
> 388963440d Watch the local Node object instead of get/sleep looping
> afa1981f1d Block scheduler startup on untainted node when using embedded CCM
> 3fba7c1021 (tag: v1.21.6-rc1+k3s1) Update to v1.21.6 (#4350)
> bb50c45a6f Revert "Backport bootstrap release 1.21 (#4313)"
> d413f97146 Update peer address when running cluster-reset
> f0ea0a0946 Backport bootstrap release 1.21 (#4313)
> 63bcc307fb Bump klipper-helm version
> 50fb1ce065 Added configuration input to etcd-snapshot (#4280) (#4282)
> 944ea312be Merge pull request #4267 from manuelbuil/1.21-flannel-update
> 11dce34b4e Update to the newest flannel
> 41b0997e31 Add dual-stack support
> a18c2efb4c Refactor log and reaper exec to omit MAINPID
> 504e249a5e Add containerd ready channel to delay etcd node join
> e814850eef Fix premature etcd shutdown when joining an existing cluster
> 7cbdea6bd2 go mod tidy
> 557d425010 Minor cleanup on cribbed function
> 4f28561e34 Wait for apiserver readyz instead of healthz
> 17f1aa36e2 Merge pull request #4251 from manuelbuil/1.21-race-fix
> 89f5721a3a Fix race condition in cloud provider
> 4aa9553978 [Release-1.21] - Add etcd s3 timeout (#4207) (#4228)
> 22f7f1c41a Make sure there are no duplicates in etcd member list (#4025) (#4213)
> e7bf7b141f Display cluster tls error only in debug mode (#4201)
> aa5a0a8c78 set transport to skip verify if se skip flag passed (#4102) (#4104)
> 3ee5098225 Add "etcd-" prefix to etcd-snapshot commands as aliases (#4161) (#4171)
> 724ef700ba (tag: v1.21.5-rc1+k3s2, tag: v1.21.5+k3s2) Bump containerd to v1.4.11+k3s1
> 69a9f46bce Don't evacuate the root cgroup when rootless
> 0af55a830a Skip tests that violate version skew policy
> 9e66f975d5 Fix PREVIOUS_CHANNEL lookup when current minor release is not stable
> 38ddda587a Properly handle operation as init process
> c948305076 Merge pull request #4099 from manuelbuil/sysctl_ipv6_inheritance_1.21
> 15f3a2ebfb Enable the inheritance of settings for ipv6
> 273827d4ba Update build images to python3 for compat with recent gsutil change
> 8c2f7ac41c Remove experimental from cluster commands
> acad8ef840 (tag: v1.21.5-rc1+k3s1, tag: v1.21.5+k3s1) [release-1.21] Update Kubernetes to v1.21.5 (#4032)
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-containers/k3s/k3s_git.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> index bcfa959..77ad6d4 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -13,10 +13,9 @@ SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.21;name=k3s;protoco
>             file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
>             file://k3s-killall.sh \
>            "
> -SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
> -SRCREV_k3s = "aa5a0a8c783a8a4475b727a04d6594c0fea09253"
> +SRCREV_k3s = "101917b0c493dd1effac1074feb1d5462b9a189b"
>
> -PV = "v1.21.5+k3s1"
> +PV = "v1.21.9+k3s1"
>
>  CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conf"
>
> @@ -30,7 +29,7 @@ PACKAGECONFIG[upx] = ",,upx-native"
>  GO_IMPORT = "import"
>  GO_BUILD_LDFLAGS = "-X github.com/rancher/k3s/pkg/version.Version=${PV} \
>                      -X github.com/rancher/k3s/pkg/version.GitCommit=${@d.getVar('SRCREV_k3s', d, 1)[:8]} \
> -                    -w -s \
> +                    -w -s -v \
>                     "
>  BIN_PREFIX ?= "${exec_prefix}/local"
>
> @@ -40,11 +39,12 @@ REQUIRED_DISTRO_FEATURES ?= "seccomp"
>  do_compile() {
>          export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
>          export CGO_ENABLED="1"
> -        export GOFLAGS="-mod=vendor"
> +        export GOFLAGS="-mod=vendor -modcacherw"
>
>          TAGS="static_build ctrd no_btrfs netcgo osusergo providerless"
>
>          cd ${S}/src/import
> +        ${GO} mod vendor -v && ${GO} mod tidy -v

Unfortunately .. no, we can't take this change.

I'm working on a full update to k3s in master, and it is running into
similar challenges due to the removal of vendor upstream.

The solution isn't simple, since it is something that has to be
generic, as it applies to many different recipes in
meta-virtualization.

Bruce

>          ${GO} build -tags "$TAGS" -ldflags "${GO_BUILD_LDFLAGS} -w -s" -o ./dist/artifacts/k3s ./cmd/server/main.go
>
>          # Use UPX if it is enabled (and thus exists) to compress binary
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7054): https://lists.yoctoproject.org/g/meta-virtualization/message/7054
> Mute This Topic: https://lists.yoctoproject.org/mt/89023734/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


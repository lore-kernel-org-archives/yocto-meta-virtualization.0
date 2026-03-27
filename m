Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C29310BA434
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 14:07:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73165.1774620423773991033
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 07:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=Z7Mwn/zI;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.46, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b1cf1212so93750f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1774620422; x=1775225222; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2l2UHAW4h/dkR2RFrOQ6d7GaBiLgwqmCYdITTv3c1lE=;
        b=Z7Mwn/zIS7sQMkKmim/L+He87SLo2lW7SJ2PzRs7wGoRdAtbploqF3FeXIVQiyUeMf
         2GAnCCGvmDJ9zR1ZERIsewNEQHSW1sQImMeUKAo+qveyC/2+AeNo2YZ/3zs2NYfEWkRl
         FK3t4TAscyVqD68HZo/4RwV12CBQwQAt70Sw9ngdAX+bYyZ3MNmjX7VKePvYjNBXMI/i
         wm5i5ant/gyMLR9u1GcCGVnD5fYRVkTkt651brhumr+P0PU30sWxek3ix8CRLUHTdICl
         Svc2WqvdBqYiKDq8Wd5CxO70YXv+oLav37sydHajsxThesITRmdHF9kIGkWcxAH1IpME
         kRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620422; x=1775225222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2l2UHAW4h/dkR2RFrOQ6d7GaBiLgwqmCYdITTv3c1lE=;
        b=cNcsTiTZdwnZspL7DlWSH6TYLx8ZIY/XY+JqlkbD5d17mlzcyKxZA+7+HWjMpw87Az
         oQCn4N1rVb1HY8rb7/XwtbeLs3f5ryvt3eQ/F8+DKo5yha5aHvGrtNAzc/mAnt/CaRBZ
         aLAN11IySAdTEShENK0wd5c5Od766aknsjCbK3lb31Gu2VKQPoLH9wUfTvMcVnjXS9Wo
         RmG6z5zPL5mTzM3AcTHX32AJ9IoHQVYZFhpdKw3stTUb231YgXHG2MQjDXhkr7E/XhIz
         5bYegOJzS10AAcomrDgvIKGsoOHA+m32EJuTl/LEumUx6wCI2uhM0LIqP7ZR88ue3qYB
         k6oA==
X-Gm-Message-State: AOJu0YwxlZjyJHovEdq7llvDZzz6Xv+rfmjZ6MqfRNcF5PxjBAhqXKXc
	o81Y+RN5in8qdXwVAw20Oi3mwTwquytzTDSFfUfDEMMt7wDARSlsVfUtQq7+z/VOtqcVOenSD06
	ap19OTy2VQZ9fEdEPIFuIkNCznELdxFtUzDe+ac/JnYl1vXc2U7fSGU+idgt6zY6UZWrl0aePLT
	VTRg5iRIlbAq0TzTX80w==
X-Gm-Gg: ATEYQzz29SMH4VyyaU3+PNSa05FbYZoDaaUJJqULN2Z4ufjPmdzNCWS32v1DxuKam1E
	8N3h4GOoJACPa3DlkVfN91HnS5Vb2HQGbCvpp05fVTniBYymqmrD8xMmHa6thKGKmSW3oAYbjbH
	TiPziVJ4KaJ7Ho3s1eLgCIB+PPFWc9S2pgHFDMHHmk5JEB3n9GVFlA7hyBpI8AL6nN9uJXhawfJ
	hYTdbcV1PTT3Zo3Rqj4rj8p9f0vhSb7RXRUfoAqS/IPfHYmc9VJ7FUMr2j3wGna9XByLXLDb1Em
	SuuyOtp3qUKv3yRZR4XlGE748t+fnaEXcke8osIZYvo+DeTwMthRkx1HbCNV74QWOYX/L/po1C3
	IHodqg+Of4XM3SzwICctbar4/ZDSUKeXHbZ6OFIucK84eoaniSFrSEq+ZkVD+eQdVGidvndMABq
	LIyGxR7asLQHPRNtTgpOuJQWCdKr/K8XgbYDRbRObvRhoCuSkJZYF5c8R74hX3FeNjkuqd5BKuH
	bGXbw==
X-Received: by 2002:a05:6000:230d:b0:43b:6559:f14c with SMTP id ffacd0b85a97d-43b9e987efemr2128115f8f.2.1774620422046;
        Fri, 27 Mar 2026 07:07:02 -0700 (PDT)
Received: from localhost (dslb-002-205-018-238.002.205.pools.vodafone-ip.de. [2.205.18.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e35esm13804200f8f.6.2026.03.27.07.07.01
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:07:01 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 4/4] runc-docker: update to 1.1.15
Date: Fri, 27 Mar 2026 15:06:40 +0100
Message-ID: <20260327140640.126833-5-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327140640.126833-1-jonas.gorski@bisdn.de>
References: <20260327140640.126833-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 14:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9681

Bump runc to to v1.1.15-2-g068337925cd4:

    068337925cd4 Merge pull request #4422 from rata/release-1.1.15
    9f4baaac61d1 VERSION: back to development
    bc20cb4497af VERSION: release 1.1.15
    2790485e3eca CHANGELOG: Remove empty changed line
    ed38aea9dc58 Merge pull request #4425 from kolyshkin/1.1-fix-mount-leak
    65aa700fc371 [1.1] runc run: fix mount leak
    a4cebd3549ec Merge pull request #4423 from rata/1-1-fix-CI
    719e2bc2c376 increase memory.max in cgroups.bats
    3216d3b72e15 merge #4391 into opencontainers/runc:release-1.1
    bd671b6a1361 Merge pull request #4392 from cyphar/1.1-remove-bindfd
    614ce12f0e97 [1.1] nsenter: cloned_binary: remove bindfd logic entirely
    618e149e4ae5 [1.1] seccomp: patchbpf: always include native architectur=
e in stub
    d85b58388f40 [1.1] seccomp: patchbpf: rename nativeArch -> linuxAuditAr=
ch
    6223a65d5d6f [1.1] libct/seccomp/patchbpf: rm duplicated code
    2655e7c5a859 VERSION: back to development
    2c9f5602f0ba VERSION: release 1.1.14
    a86c3d88370a Merge commit from fork
    f0b652ea61ff [1.1] rootfs: try to scope MkdirAll to stay inside the roo=
tfs
    8781993968fd [1.1] rootfs: consolidate mountpoint creation logic
    6419fbabfbd6 Merge pull request #4382 from rata/Makefile-override-fixes
    0514204d6fcc Makefile: Add EXTRA_VERSION
    18cdc3476f91 Revert "allow overriding VERSION value in Makefile"
    f3f71a9347f0 Merge pull request #4372 from kolyshkin/1.1-go123
    7f75aec407e8 [1.1] Add Go 1.23, drop 1.21
    931f46304b3d Merge pull request #4361 from austinvazquez/backport-proto=
buf-updates-to-1.1
    1f587049fd85 build(deps): bump google.golang.org/protobuf from 1.32.0 t=
o 1.33.0
    31f29447d3fb build(deps): bump google.golang.org/protobuf from 1.31.0 t=
o 1.32.0
    ac5fc48ad18c build(deps): bump google.golang.org/protobuf from 1.30.0 t=
o 1.31.0
    3b5bf8f2a9fa build(deps): bump google.golang.org/protobuf from 1.29.1 t=
o 1.30.0
    81461edc125b build(deps): bump google.golang.org/protobuf from 1.29.0 t=
o 1.29.1
    2a9acb99b4a9 build(deps): bump google.golang.org/protobuf from 1.28.1 t=
o 1.29.0
    19c47f652dd1 build(deps): bump google.golang.org/protobuf from 1.28.0 t=
o 1.28.1
    88f54b20fc46 build(deps): bump google.golang.org/protobuf from 1.27.1 t=
o 1.28.0
    615068f17a31 Merge pull request #4334 from cyphar/1.1-rootfs-mountfd
    a0292ca6ffb3 [1.1] rootfs: fix 'can we mount on top of /proc' check
    b36a0f453712 Merge pull request #4336 from cyphar/1.1-rm-c7
    5b89027afc11 [1.1] ci/cirrus: switch from CentOS to Almalinux
    ed406952fc28 Merge pull request #4318 from lifubang/release-1.1.13
    ec1bc45d462c VERSION: back to development
    58aa9203c123 VERSION: release 1.1.13
    2b3a2472d189 Merge pull request #4316 from lifubang/backport-4189
    3507adac19ff Merge pull request #4315 from lifubang/backport-4311
    0f7150ade8ca script/*: fix gpg usage wrt keyboxd
    80186fec5cf4 fix a debug msg for user ns in nsexec
    8407d3c6021c Merge pull request #4313 from kolyshkin/1.1-backport-4292
    7219e0afffcd Dockerfile: bump Debian to 12, Go to 1.21
    c9beabc8d8d5 ci: switch to go 1.22 as main version
    4578c6c5dbdb libct/nsenter: stop blacklisting go 1.22+
    c488d13a5331 use go mod instead of go get in spec.bats
    ae85f058ccff ci/gha: bump golangci-lint to v1.57
    327e07e96814 ci/gha: bump golangci-lint to v1.54
    65bdf604ddb9 libct/user: gofumpt -w
    4d097af534a0 ci/gha: bump golangci-lint-action from 5 to 6
    fb236084374b ci/gha: bump golangci/golangci-lint-action to v5
    8bfc75a25d2b CI: run apt with -y
    e546ddeec869 ci/gha: switch some jobs to ubuntu-22.04
    0d19e78b847a build(deps): bump actions/setup-go from 4 to 5
    b36844518a36 build(deps): bump actions/checkout from 3 to 4
    cb2d85dcde5f build(deps): bump tim-actions/commit-message-checker-with-=
regex
    25e27d7eef28 build(deps): bump actions/upload-artifact from 3 to 4
    2ac8b11f48a0 build(deps): bump golangci/golangci-lint-action from 3 to =
4
    7d86e7d9eceb Merge pull request #4299 from kolyshkin/1.1-4290
    096e6f88f0f0 [1.1] libct/system: ClearRlimitNofileCache for go 1.23
    14181f438e35 Merge pull request #4308 from kolyshkin/1.1-rm-cs8
    fc7af59a6b1f ci/cirrus: rm centos stream 8
    a1610b56a4a3 Merge pull request #4305 from lifubang/backport-cs8eol
    9629fd9554a2 ci: workaround for centos stream 8 being EOLed
    20ef9762dae9 Merge pull request #4300 from lifubang/backport-codespell-=
2.3.0
    3b7fcf76ef7e ci: pin codespell
    f8f7defa85f4 Fix codespell warnings
    a12f444afbb8 Merge pull request #4284 from kolyshkin/1.1-fix-4094
    860f05f307f4 libct/cg/fs: fix setting rt_period vs rt_runtime
    9244703011d5 Merge pull request #4277 from lifubang/backport-4265-nofil=
erlimit
    51dc97286443 Merge pull request #4231 from kolyshkin/1.1-3349
    c918058bb76c fix comments for ClearRlimitNofileCache
    2992049dc31c update/add some tests for rlimit
    d7a29a3b3367 libct: clean cached rlimit nofile in go runtime
    42c2ab2b7cb9 use go 1.18 in go.mod
    83ecd11c29ac runc exec: setupRlimits after syscall.rlimit.init() comple=
ted
    fbddb715edbb libct: fix a comment
    debf52aa5b52 deprecate libct.system.Execv
    986edbe60ff9 list: use Info(), fix race with delete
    09214f21da8e list: getContainers: less indentation
    007abf31f87a Merge pull request #4270 from akhilerm/backport-1.1-4269
    6f4d975c402d allow overriding VERSION value in Makefile
    e8bb71e147d6 Merge pull request #4257 from sohankunkerkar/release-1.1
    6379b58d9701 libcontainer: force apps to think fips is enabled/disabled=
 for testing
    5bfff6ae24d0 Merge pull request #4261 from kolyshkin/1.1-4256
    265e73718063 Vagrantfile.fedora: bump Fedora to 39
    b0691cafe392 Merge pull request #4244 from kycheng/chore/net-cve
    59056a0213e7 silence security false positives from golang/net
    148fdabd7053 Merge pull request #4241 from kolyshkin/1.1.13-ci-fixes
    452bf88ebf5b build: update libseccomp to v2.5.5
    3fada6eca4e6 tests/int: fix flaky "runc run with tmpfs perm"
    aae41a4b79d3 Fix integration tests failure when calling "ip"
    82a8b979ef1a update go version to 1.21 in cirrus ci
    03271050eb94 ci/gha/cross-i386: pin Go to 1.21

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 recipes-containers/runc/runc-docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-container=
s/runc/runc-docker_git.bb
index 8d078e852642..16bc6639c452 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
=20
 # Note: this rev is before the required protocol field, update when all co=
mponents
 #       have been updated to match.
-SRCREV_runc-docker =3D "a9833ff391a71b30069a6c3f816db113379a4346"
+SRCREV_runc-docker =3D "068337925cd4286782c1c576132590992cc8c728"
 SRC_URI =3D "git://github.com/opencontainers/runc;branch=3Drelease-1.1;nam=
e=3Drunc-docker;protocol=3Dhttps \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-r=
e.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
=20
-RUNC_VERSION =3D "1.1.12"
+RUNC_VERSION =3D "1.1.15"
=20
 CVE_PRODUCT =3D "runc"
--=20
2.53.0


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=A0Dr.-Ing. Hagen Woesner, Andreas K=F6psel


Commercial=20
register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=A0
DE283257294





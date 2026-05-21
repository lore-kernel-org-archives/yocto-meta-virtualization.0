Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414E2CD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 03:57:11 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29082.1779335827532810187
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 May 2026 20:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TdX7ztr/;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-367c26471f5so3570230a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 May 2026 20:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779335827; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVTAsLXYelXT8++/hzI1BsD4mIj/LrnCYnliKNmCnH5soA/Cx2PyxqzvQSeSdgGokJ
         z3OPT/A3W0XDPITyRbagGhsO7k7Zk259OEa6RvZnZaH9W24B0yRxV+R6S6fNE06BjHNJ
         7l/zroQnOpUmnySqXSzzxiyLSrRssDBWyGJUBbgo8thxDTdl3WI49LVMDzD9pywpu5Km
         uCzLQaLgDr7dspn03hcKEIjsEobfq2eG3TLh5mpyLpAtHQeBf6HghTwwx1S7G+Gv/v7C
         xjsSx49B5I99YK6+3BLGd9w5SDn9ubWfFONlWI1VvHdjkt5phxgUrXQRILKywVUN/GBE
         dLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vQPKBZ/fDl6xAhs5U9yUSig22ROvVTgv8BWukUVvk/w=;
        fh=T1fsFJFZd3expnPhH4HQBhUXgCpxpAql7h9peGDMJdM=;
        b=JrrqzoszdfqK2Sg6PrM/pOlk/vE/CWpcNltRmYzicX1loEbi8UO0z1bde2tw43jNt9
         yg5HhAq5V/YMeQgyauNE5SyGUxLkeRvpHdbipvnvEurnuomJPGxsII4EHYK/shZrVJuv
         qQBiEY+CIH9HqhL6T9rUkinJx6iTyoIzEf0QBMaY8LX12NRVRPHYjZCKIPZeRds31hAy
         qQIUUptUMxM0EbJKFAkS4GStRM0mDs2Ux3BPD6Iqnng6easfhRfdbaMi+SI3SbpB/Sez
         85AzeA+maZQf+TBuO/lkeT3k985HrSh5aetG9WJrd2gsz7uhv2TEIqWFVr5zxKQKbEyP
         WGEA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779335827; x=1779940627; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vQPKBZ/fDl6xAhs5U9yUSig22ROvVTgv8BWukUVvk/w=;
        b=TdX7ztr/LqJE0mAEoIIY+sctkR6tHQtZ2+/H7Vc2c03FEg293q0H4WHaNE3yeu+7MX
         m0oO09UwGpjRjtwcxt/EW34ijhQB3yQIFwBq/u6LsoJz7+6CdeJ/AQ7TxIkBCc7EhrrN
         gC6ueSJRe2cw4vqxr0XSubGaAq6UOgs00Ed7sA8CteiVAjS3VTutw/pe4uOcpjzOjk3a
         r0mWHoaxXjmWCvH0Qxfnn4jjNqaAjfeKiMExB0cAvNXGaqIhSXXkx/E9zChBshLPRHYA
         679+YRrcHRWhHaS5KtbwPzB//edmghOc+36B55TqpYf+Xu/hAlhFjVS7yWMhv8NlPFVr
         4tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779335827; x=1779940627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQPKBZ/fDl6xAhs5U9yUSig22ROvVTgv8BWukUVvk/w=;
        b=skX4YV0z9TLiLUZbCwfdqvfpTdioeKi142l2RlHhmZVm/IyoX4H0VqyMiOinoCjh2P
         dswcTf0VykTT3PWEQb+7nxTGBlFwKMas4nOk3GBfwZlnC9GYREJ1glIYGpKZ8BN/YGhn
         U32ysfjDAHuuBfnXM5LtCZmm0Ip7n44MqAdIxis5VxbvHPwjK3S/nya5ZFcueCH1k6cL
         4Q/quPI7PuXkzWs51O+heqQYLGW38gDxszn9v7a8+Fk+VcEYxGt5yD1u0aKuRLrgj7Pq
         dZ8JzcfiIX1Yqiqw1jRGA4lVctNyxdCR1U5jx0I/mg3VZw0h2x+noKcTFYj+s9u7+zb/
         hhLQ==
X-Gm-Message-State: AOJu0Ywi1bouYdcHub6h0+ROXbusbLRKhpSOmRlFZ0qB5CqqXcX2IyDE
	mH9OOkTG5nBgITcEk6QcLMAZeLICYnArSm1eIp1Yc21OoMyOxd5JkDs6ovl7YQ3oBB4ZVKffdyq
	wMjYa14kx1dfacmLStjT5/z/D9ip+vZsrX7qDlfMxlw==
X-Gm-Gg: Acq92OGz+kt/ao+I+n4vJrw39GHFu9Fsps+w6x1lQRn9iXJ/bCQwdXwA0xuXVPb8Zgn
	HA50zB0IJXfvrhsq9etQUuzc+SnqLI7RnoKDR9ikX/m7CPnDAu849vVXjrVkYNfgYMiZ8s2nQoK
	NS9YGqx7yytwc3I2srJq7aWLYlQn2HPdeBcVNa9DbM2Yi9Upt03bt7HBy3dfjA0ZBgEYVnfK6rb
	oo2ETKNNKw+AjadTXzOIhh8DqEdj1c/vGbrmXHKsk25/NCkICb/ZQqyP+X7xMM4RDmmkAi2rZWf
	mQXqsIR7biS2FaOnj3FonaA1wMnFA1CDCchXDRKGzQbnWWWWIe40Y1y4Pug9ENEytmcvD+wryK3
	RhSm7hUWq8LXEM2/J15nAt8M5c0aC2sfNul2L7w==
X-Received: by 2002:a17:90b:57ce:b0:368:a297:bd3d with SMTP id
 98e67ed59e1d1-36a44f18393mr1231556a91.3.1779335826293; Wed, 20 May 2026
 20:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260521033003.279488-1-zhixiong.chi@windriver.com>
In-Reply-To: <20260521033003.279488-1-zhixiong.chi@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 May 2026 21:56:55 -0600
X-Gm-Features: AVHnY4J3HgJLMsiw0F8df_Zg9aGPY8SrtX13kjLUMbGqohao6LEqQe3vDd8W38M
Message-ID: <CADkTA4MdshXAg_bVGaGHo5JEr9qPW2VRZe7+yqbaGOGfdy=V_A@mail.gmail.com>
Subject: Re: [meta-virtualization][wrynose][PATCH] docker: upgrade to v29.4.3
To: zhixiong.chi@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dcc58f06524be7b9"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 May 2026 03:57:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9800

--000000000000dcc58f06524be7b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is outside of the -stable policy, as it is more than a bug fix
release. Only a 3rd digit bump would typically be considered for wrynose.

When I get to the m2 update window for master, I can consider special case
larger bumps to wrynose, but not until then. So I've tagged this and will
look at it more closely once master has moved past this release.

Bruce

On Wed, May 20, 2026 at 9:30=E2=80=AFPM Zhixiong Chi via lists.yoctoproject=
.org
<zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:

> Bumping moby to version docker-v29.4.3, which comprises the following
> commits:
>
>     96127a375b daemon: Always reload AppArmor profile at daemon startup
>     4dcaf2c1c6 vendor: github.com/moby/profiles/seccomp v0.2.3 (Drop
> socketcall block)
>     b8cccd63c1 integration/container: Handle socketcall return EPERM
>     4bce638439 vendor: github.com/moby/profiles/apparmor v0.2.1 (deny
> network alg)
>     67d638fca9 integration/container: skip socketcall test without
> AppArmor or SELinux
>     ee5ac4c7ca contrib/selinux: Add CIL policy to deny AF_ALG sockets in
> containers
>     dc7f064875 integration/container: Verify AF_INET socketcall still wor=
ks
>     f89c5935ab integration/container: Drop i386 cross-compile socketcall
> test
>     729750e8f1 gha/validate-milestone: Read versions.yaml from base branc=
h
>     56a72c7494 [docker-29.x] update milestone version
>     becdb42e26 vendor: github.com/moby/profiles/seccomp v0.2.2
>     a1197d997e vendor: github.com/moby/profiles/seccomp v0.2.1
>     1818ec7c13 integration/container: Add socketcall AF_ALG denial tests
>     c7337e2430 integration/container: Add test for denied socket address
> families
>     a529a27817 integration/container: Fix flaky
> TestContainerRestartWithCancelledRequest on Windows
>     a65bd0440b releases: Bump patch
>     34bd1ebdf4 vendor: github.com/moby/moby/client v0.4.1
>     b63208b64b vendor: github.com/moby/moby/api v1.54.2
>     5be108f817 vendor: github.com/sigstore/timestamp-authority/v2 v2.0.6
>     727b81991c vendor: github.com/sigstore/sigstore v1.10.5
>     bad8e1b799 vendor: github.com/go-openapi/* deps
>     f3cadf69dc vendor: github.com/Azure/azure-sdk-for-go/sdk/azcore
> v1.21.0
>     5c6a343842 vendor: google.golang.org/api v0.272.0
>     463f4c0943 No longer a reviewer; update email address
>     98c7106fbe vendor: github.com/hashicorp/memberlist v0.5.4,
> hashicorp/serf v0.10.2
>     f69fed1350 fix(deps): update module github.com/aws/smithy-go to
> v1.25.0
>     eb2672a3b9 chore(deps): update actions/github-script action to v9
>     75c2f4fb37 fix(deps): update module
> go.opentelemetry.io/contrib/processors/baggagecopy to v0.16.0
>     6fa46cf8c7 fix(deps): update golang.org/x packages
>     0aaa2d3e3a README: Add Go modules section documenting the v29 module
> split
>     68d1d1a947 vendor: go.opentelemetry.io/contrib v0.68.0
>     8384598603 vendor: go.opentelemetry.io/otel v1.43.0
>     836b06d8da vendor: google.golang.org/genproto 9d38bb4040a9
>     0aa66fca01 fix(deps): update module google.golang.org/grpc to v1.80.0
>     7ab051cf89 daemon/logger/local: marshal: remove redundant resetProto
>     23020513e6 chore(deps): update docker/github-builder action to v1.6.0
>     6e22bc8095 chore(deps): update docker/bake-action action to v7.1.0
>     b1637ed54b vendor: github.com/hashicorp/golang-lru v1.0.2
>     d994daf576 daemon/containerd: fix label!=3D filter ignoring images
> without label
>     c255b67c0f Update github/codeql-action action to v4.35.2
>     9136afe4fe Update actions/upload-artifact action to v7.0.1
>     dc48cea266 api/docs: cleanup changelog
>     9c084cad3e ci: skip using xargs
>     c621624e2f libnetwork: Always clean up endpoint driver info in sbLeav=
e
>     6e9f9bc0a5 ci: fix workflow permission errors
>     10b0401423 Update actions/cache action to v5.0.5
>     b7e7d3f065 libnetwork: Remove montanaflynn/stats dependency
>     70907e2988 libnetwork: Drop golang-set dependency
>     2437d5d646 ci: use bake matrix subaction
>     1743957d3f fix zizmor findings
>     7136f5e946 Dockerfile: update delve to v1.26.1
>     0f5a7ae948 Dockerfile: update Docker CLI to v29.4.0
>     270b511972 Dockerfile: update docker compose to v5.1.3
>     cdb3fc279d Dockerfile: update buildx to v0.33.0
>     c6d4830c14 vendor: github.com/docker/go-connections v0.7.0
>     5c80a6e826 api: align Topology in versioned OpenAPI specs with
> Segments JSON shape
>     0c878186d3 ci: zizmor workflow
>     97cb71d7ed pkg/registry: use stdlib's x509.SystemCertPool on Windows
>     ba1f3e8aa8 Dockerfile: update containerd binary to v2.2.3, runhcs
> v0.14.1
>     a2cdd57812 vendor: github.com/containerd/containerd/v2 v2.2.3
>     c4f4eb3f5f api: align Topology swagger with Segments JSON shape
>     f8873b7796 daemon/logger: use consts for common log-options
>     30b7b3f919 daemon/logger: define consts for common log-options
>     9008249e8a daemon/logger/local: add a constructor for config
>     33261e9a45 daemon/logger/local: unify constructors
>     5d5797002d daemon/logger/local: test cleanups
>     69caf3d4c7 daemon/logger/local: improve TestDecode, rename to
> TestDecodeIncompleteRecord
>     f3f3040713 daemon/logger/local: use struct-literal for pmetadata
>     a331d4d7a3 gha: Add milestone validation workflow
>     10eb86543f Cleanup releases dir
>     3b22c500d5 daemon: retry secrets dir remount on transient EBUSY
>     0ea9255e50 daemon/logger/splunk: tryPostMessages use
> http.NewRequestWithContext
>     0677030570 daemon/logger: use uniform location for registering driver=
s
>     8e79aacee6 daemon/logger/journald: remove outdated comment
>     e0b5ab2f98 daemon/logger/loggerutils: ParseLogTag: add fast path
>     3ba0b72b78 daemon/logger/loggerutils: ParseLogTag: fix panic and imag=
e
> ID
>     4f2553e81a daemon/logger/loggerutils: ParseLogTag: improve
> test-coverage
>     7bfa790f2b daemon/logger/jsonfilelog: be more explicit on handling
> optional "tag"
>     ec909a2239 daemon/logger/jsonfilelog: JSONFileLogger: remove unused
> "tag" field
>     6a5e00fe5f daemon/logger: Info: touch-up godoc
>     1a45789c04 client: imageDiskUsageFromLegacyAPI: explicitly exclude
> "-1" for containers
>     25ffdb23d9 daemon: Daemon.imageDiskUsage: explicitly exclude "-1" for
> containers
>     e0fc07b8cf gha/labeler: Only assign Windows to Windows-only changes
>     b3bd13ad10 daemon/pkg/registry: minor cleanups
>     377e85700f vendor: github.com/Microsoft/hcsshim v0.14.1
>     e30a6fa93b libnetwork: respect gw priority per address family
>     3541b0d0fd update to Go 1.26.2
>     2601915b10 client/internal: touch-up godoc
>     689accfe29 client/internal: fix RSFilterReader returning (0, nil)
> after filtering
>     159b3317f0 client/internal: RSFilterReader: un-export, and remove
> unused buffer
>     ba66582228 client/internal: Stream.JSONMessages: improve error handli=
ng
>     5f08008342 client/internal: Stream.JSONMessages: move reader inside
> the func
>     d5d18015e1 client/internal: Stream.Wait: return errdefs errors
>     82ff7e9f76 client/internal: Stream.Wait: fix missing error-handling
>     4d1d9ee358 go.mod: add back replace rules
>     00840cd39c ci: buildkit: pin registry to v3.0.0
>     a2eaebb011 api/docs: lower deprecation heading to a h4
>     f44956451a CI: add back ubuntu-24.04 + rootless
>     ca69153e28 api/docs: restore changelog for API v1.0 - v1.13
>     1055b7a1a6 api/docs: restore API versions v1.0 - v1.13
>     0d2d3f348d api/docs: restore API versions v1.14 - v1.17
>     dc824e3d8d api/docs: restore API versions v1.18 - v1.23
>     70043cd439 ci: fix bin-image workflow
>     f42ff6a603 internal/testutil/daemon.New: cleanup test paths
>     7094e8c3ef integration/daemon: TestLiveRestore remove quote from
> test-name
>     3a7e8e285e vendor: github.com/moby/moby/client v0.4.0
>     f8946fc137 vendor: github.com/moby/moby/api v1.54.1
>     f1b420bf02 Drop replace rules
>     c286d4ce13 Dockerfile: go install: use Git SourceOp
>     d3a677d730 Dockerfile: use Git SourceOp
>     07a5e924ce Fix typos and misspellings in comments, tests, and docs
>     6604bd0ddc update AUTHORS and .mailmap
>     84743bdda3 client/internal/mod: swap order of "ok" bool
>     9dec3bf78f daemon: include moby module version in version response
>     de68dce70d daemon/internal/mod: also check main module
>     1bed74db50 daemon/internal/mod: reimplement without golang.org/x/mod
> dependency
>     74e74ed5ee builder-next/worker: move mod package to daemon/internal
>     80c22f0982 daemon: respect explicit AppArmor profile on privileged
> containers
>     b8057a3a58 api/types/network: fix handling of unmapped ports
> (ephemeral ports)
>     2d35a29f63 vendor: github.com/microsoft/hcsshim v0.14.0
>     4975231ecc daemon/volume/local: New: ignore non-volume directories
>     538f407103 daemon/volume/local: store path to opts.json
>     5eeb08ae1c fix: use t.Cleanup to prevent goroutine leak in
> TestCancelledUpload
>     735d17e1a5 fix: return 400 instead of 500 for invalid request
> parameters
>     9aa5ac3034 client/pkg/jsonmessage: use functional options for display
> funcs
>     06b31dcd12 daemon/pkg/opts: fix ValidateIPAddress docstring
>     ad67096edf gha: validate-api-swagger: remove redundant 'make image'
>     8769bda667 gha: buildkit: fix go version
>     e0999bd5ec update to go1.26.1
>     6ddd4ff73d integration/plugin: remove redundant assert
>     9295e2cd84 client: fix race in cancelReadCloser
>     6bfde409bd client: fix typo: TestWithHTTTPHeaders ->
> TestWithHTTPHeaders
>     72142ab278 daemon: buildSandboxOptions: warn, not panic on invalid
> extra host
>     98840db4d3 daemon: Daemon.restore: trim whitespace in extra-hosts
>     dd11127524 daemon/pkg/opts: ValidateIPAddress: use netip.Parse
>     333f39ce02 remove uses of jsonmessage.DisplayJSONMessagesStream in
> tests
>     6aedc6ba32 client/pkg/jsonmessage: add DisplayStream and
> DisplayMessages utils
>     5672c51b00 vendor: update buildkit to v0.29.0
>     abb2a31c8a daemon: Daemon.SystemVersion: align fields with api type
>     65ce470c2a fix(deps): update module
> github.com/aws/aws-sdk-go-v2/service/cloudwatchlogs to v1.66.0
>     281f4b6767 chore(deps): update actions/setup-go action to v6.4.0
>     38c77a9189 daemon/libnetwork/ns: make NetlinkSocketsTimeout a const
>     5378f5427f daemon/libnetwork/ns: remove ParseHandlerInt, add NsHandle
>     af73684bc3 daemon/libnetwork/ns: use sync.OnceValues
>     635f4c3dc4 daemon/libnetwork/ns: remove windows stub
>     579280d444 daemon/libnetwork/ns: suppress some unhandled errors
>     dee7411f05 fix(libnetwork): nil pointer will cause panic
>     434ec1655c daemon/volume/service: deprecate OpErr.Cause (Causer
> interface)
>     57d0f88684 golangci-lint: enable godoclint linter
>     dee3c452d7 daemon/volume/local: remove duplicate package doc
>     28aeae20dc client: WithHTTPHeaders: produce error if duplicate header=
s
> are detected
>     1ec892c555 client: WithHTTPHeaders: improve doc and add test coverage
>     d7d856927b daemon: fix typo in filedescriptors filenames
>     d71f3ea5da ci: fix upload sarif action
>     1769b3eb5d chore(deps): update github/codeql-action action to v4.35.1
>     beba95c819 vendor: update buildkit to v0.29.0-rc1
>     5da773a71d chore(deps): update codecov/codecov-action action to v6
>     1293d50b38 fix(deps): update module github.com/pelletier/go-toml/v2
> to v2.3.0
>     12ae6dd67e fix(deps): update module github.com/montanaflynn/stats to
> v0.9.0
>     3fa5ec578b chore(deps): update github/codeql-action action to v4.34.1
>     0c7f2b3d38 chore(deps): update codecov/codecov-action action to v5.5.=
4
>     c66815426c chore(deps): update docker/github-builder action to v1.4.0
>     615cf6345f chore(deps): update actions/setup-go action to v6.3.0
>     fb146a3806 fix(deps): update aws-sdk-go-v2 monorepo
>     c36e70524b chore(deps): update actions/labeler action to v6.0.1
>     0d0751397d Dockerfile: update runc binary to v1.3.5
>     96343dd0b5 chore(deps): update actions/download-artifact action to
> v8.0.1
>     49a4a47df5 chore(deps): update actions/checkout action to v6.0.2
>     45ec277dd5 vendor: go.opentelemetry.io/otel/exporters v1.42.0
>     bb79587d84 fix(deps): update opentelemetry-go-contrib monorepo
>     ce7b3aaa0e chore(deps): update actions/cache action to v5.0.4
>     f7e4fff10b docs: fix remaining broken links in contributing docs
>     9e26694618 vendor: github.com/moby/policy-helpers b7c0b994300b
>     044d59bbd1 Dockerfile: use set -x in here-docs for visibility in
> build-logs
>     695e8b3074 vendor: golang.org/x/tools v0.43.0
>     e18b58d6a4 vendor: golang.org/x/oauth2 v0.36.0
>     cb3065011c vendor: golang.org/x/mod v0.34.0
>     c02c294e81 vendor: golang.org/x/net v0.52.0
>     7b9fe27a4d vendor: golang.org/x/time v0.15.0
>     07304a4ffc vendor: golang.org/x/text v0.35.0
>     37ece0f46e vendor: golang.org/x/sync v0.20.0
>     c0e612d623 vendor: golang.org/x/sys v0.42.0
>     21d4e2525a fix(deps): update opentelemetry-go monorepo to v1.42.0
>     dcbc18d954 fix(deps): update module github.com/aws/smithy-go to
> v1.24.2
>     b24c8272e5 go fix "omitempty"
>     f7aea04bb3 go fix (GOOS=3Dlinux and windows)
>     5cf47c0d15 pkg/plugins/pluginrpc-gen: go fix, and tidy up
>     91cd097119 docs: fix broken docker docs links in CONTRIBUTING.md
>     701ea1cb6b vendor: update buildkit to v0.28.1
>     830ddb26a2 vendor: update buildkit to v0.28.1
>     c7fdc58b04 ci: pin all actions
>     5ba08b6ff1 chore(deps): update docker/setup-qemu-action action to v4
>     db1af4f6f9 chore(deps): update docker/setup-buildx-action action to v=
4
>     b588d1a594 ci: pin all actions
>     f4d6f25bf0 plugin: Fix off-by-one in privilege validation
>     99a095ecf0 plugin: Fix off-by-one in privilege validation
>     f302d06687 pkg/authz: Increase body limit to 4 MiB
>     7a40298211 pkg/authz: Reject requests exceeding body size limit
>     6f80a57b4f chore(deps): update docker/setup-qemu-action action to v4
>     849efd0d3e chore(deps): update docker/setup-buildx-action action to v=
4
>     ec76e94183 pkg/authz: Increase body limit to 4 MiB
>     7a767b27fd pkg/authz: Reject requests exceeding body size limit
>     b66b2f77e0 ci: renovate: pin actions to digests
>     f848306ce3 vendor: github.com/moby/patternmatcher v0.6.1
>     e1c0b3d487 Dockerfile: update containerd to v2.2.2
>     a9dbf50521 ci: update docker/bake-action v7
>     ef08116394 update to go1.25.8
>     b9e4f34371 ci: module-replace: ignore Dockerfile for api changes
>     1175d707ad vendor: github.com/containerd/ttrpc v1.2.8
>     968fb5787c daemon: restore: register containers without rwlayer
>     1bd71d5d87 vendor: github.com/moby/patternmatcher v0.6.1
>     391789a6e1 vendor: github.com/klauspost/compress v1.18.5
>     435fd64319 client: fix TestNewClientWithOpsFromEnv
>     673e2e2467 client: WithTraceProvider don't wrap WithTraceOptions
>     760f375400 client: WithTLSClientConfig, WithTLSClientConfigFromEnv:
> touch-up docs
>     d85e410aa6 daemon/containerd: register Sigstore media type prefixes t=
o
> suppress unknown-type warnings
>     619ecc9b53 transport: enable HTTP keep-alive for registry connections
>     26d0774539 integration: ignore container Status field in DiskUsage
> test comparisons
>     d74953b829 fix(deps): update module cloud.google.com/go/logging to
> v1.13.2
>     5220d603f9 chore(deps): update docker/compose-bin docker tag to v5.1.=
1
>     04c1d25809 daemon/internal/containerfs: Retry on ENOTEMPTY error
> during directory deletion
>     46dba49ec8 Fix reclaimable image disk usage calculation for in-use
> images
>     a17a5647f8 fix(deps): update module google.golang.org/grpc to v1.79.3
> [security]
>     3cb98cb1b3 ci: update docker/bake-action v7
>     7d06c6c502 add example for go fix
>     20f84d21ee client: add //go:fix inline directives to deprecated
> functions
>     d0a29867e7 api/types/strslice: add //go:fix inline directives for
> deprecated type
>     8582136c90 golanci-lint: gocheckcompilerdirectives: ignore "//go:fix"
>     28b29bd8b0 builder-next: replace duplicated oneOffProgress with
> progress.OneOff
>     b5bc84bec3 Fix issue moby#48093: set SystemTemp environment variable
> On Windows also set the SystemTemp environment variable, because for syst=
em
> processes GetTempPath2() uses it rather than TEMP/TMP:
> https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-ge=
ttemppath2w
>     f04f350568 dockerd-rootless.sh: check containerd-rootless.sh conflict
>     405a787917 daemon/server: don't log context cancelation as error
>     f401a9678b daemon/server/backend: ContainerLogsOptions: use time.Time
> for since, until
>     210cdcbd46 daemon/server/router: fix "no stream selected" error and
> status
>     568312cb85 daemon/internal/timestamp: replace ParseTimestamps with
> ParseUnixTimestamp
>     cfeceed9c0 daemon/internal/timestamp: improve unix timestamp parsing
>     553420b8f3 daemon/internal/timestamp: replace GetTimestamp for Parse
>     fc3cb00398 daemon/internal/timestamp: don't return value on err
>     f37fc9fb63 daemon/internal/timestamp: use table-tests
>     282297aa0c daemon/internal: GetTimestamp: don't discard nanosecs, and
> trim zero
>     8f8b23c729 daemon: fix some untyped "invalid parameter" errors
>     2d0676b8bb daemon: prevent invalid swarm events from unknown action
> kinds
>     3debf539c0 fix: typos in comments
>     480df69696 update to go1.25.6
>     ff5e19865b ci: Remove concurrency setting from golangci-lint config
>     01fc4fcf8b libnetwork: fix graceful service endpoint removal
>     3eca177282 daemon/libnetwork: Fix panic in findHNSEp when IP networks
> are nil
>     c4f4c6765e daemon/volumes: More fs friendly image mount layer names
>     a1f7fff7a9 daemon/layer_store: Use named return error for defer
>     0e600c7fc4 layer: Clean up init layer if initialization fails
>     734bb626e4 remove uses of deprecated go-archive consts
>     5eaae6db52 layer: Clean up RW layer if mount metadata save fails
>     8ebb104e36 vendor: github.com/moby/buildkit v0.26.3
>     518779c90b layer: Fix orphan creation in registerWithDescriptor
>     5a99e1d1a4 vendor: github.com/containernetworking/plugins v1.9.0
>     298e2f7d52 daemon: disallow container port 0
>     3376758770 daemon: clean up dead containers on start
>     bb2e099c3a daemon/container: Container.BackfillEmptyPBs: prevent nil
> map
>     5898ee60f4 daemon: buildCreateEndpointOptions: fix panic with "publis=
h
> all"
>     ab55325b58 gha: Fix PR branch validation
>     6280a80f32 Allow configured address with no configured subnet
>     9cbafeac46 Update docker-py in test-docker-py
>     3c6e5f0f5a Restore missing nwEndpointsMu.Lock
>     7faaa44e18 Don't try to remove cleared docker_gwbridge endpoint
>     43f91f775a integration: skip TestBuildWithHugeFile
>     bb0d79cb1a rootless: ignore error when enabling IPv6 forwarding
>     2ad480ccf5 vendor: github.com/ishidawataru/sctp
> v0.0.0-20251114114122-1
>     3076530aa6 daemon: Fix image store choice priority for prior
> graphdriver state
>     7a3cdd2c86 daemon: Add TestDetermineImageStoreChoice
>     d7b6f3a7d3 inte/networking: TestDisableIPv6OnInterface: add '-c1' to
> ping
>     7f5694cda1 inte/networking: test DNS resolution for non swarm-scoped
> nws
>     0e2d804e48 libnet: create DNS records on sbJoin (if not agent node)
>     7242ccd7a0 c8d/builder-next: Don't force unpack
>     b6705d5e1a hack/test/unit: Fix api and client module testing without
> replace rules
>
> Bumping docker/cli to v29.4.3, which comprises the following commits:
>
>     d0f5b279e9 cmd/docker-trust: bump moby/client v0.4.1, moby/api v1.54.=
2
>     b7f37e86da vendor: github.com/moby/moby/client v0.4.1, moby/api
> v1.54.2
>     266f039bb5 Dockerfile: update compose to v5.1.3
>     d74d3c3b16 Dockerfile: update buildx to v0.33.0
>     58a7c3155b golangci-lint: fix lint failures from v2.10.1 upgrade
>     f37a9e663f Dockerfile: update golangci-lint to v2.10.1
>     ee56098b07 cmd/docker-trust: bump dependencies
>     efbbc0c68c gha: Add milestone validation workflow
>     a75ab98e43 vendor: github.com/mattn/go-runewidth v0.0.23
>     b9549d3ab5 vendor: golang.org/x/net v0.53.0
>     2edf815a80 vendor: golang.org/x/term v0.42.0
>     258010c788 vendor: golang.org/x/text v0.36.0
>     cfa80d8644 vendor: golang.org/x/mod v0.35.0
>     c20b2479e0 vendor: golang.org/x/sys v0.43.0
>     573dd31bf7 vendor: github.com/docker/docker-credential-helpers v0.9.6
>     2988338b99 docs/reference: remove deprecated "--kernel-memory" flag
>     58c7328df6 man: remove deprecated "--kernel-memory" flag
>     5468871a02 contrib/completion: remove deprecated "--kernel-memory"
> flags
>     acbbeb3c3a docs: refresh legacy plugin references
>     3362ae31d0 vendor: go.opentelemetry.io/contrib v0.68.0
>     a1edb22832 vendor: go.opentelemetry.io/otel v1.43.0
>     0a24da3382 vendor: google.golang.org/grpc v1.80.0
>     f24c779887 vendor: google.golang.org/genproto/* 9d38bb4040a9
>     99aaff1807 build(deps): bump actions/upload-artifact from 7.0.0 to
> 7.0.1
>     f3c060c382 build(deps): bump docker/bake-action from 7.0.0 to 7.1.0
>     b9a052a987 vendor: github.com/docker/go-connections v0.7.0
>     0d32fde8e3 internal/registry: use stdlib's x509.SystemCertPool on
> Windows
>     ad641e5d61 cmd/docker-trust: use stdlib's x509.SystemCertPool on
> Windows
>     14aa781767 build(deps): bump docker/login-action from 4.0.0 to 4.1.0
>     d1920f0b2c update to Go 1.26.2
>     b23c1a2d76 build(deps): bump github/codeql-action from 4.34.1 to 4.35=
.1
>     c88681f8d8 vendor: moby/api v1.54.1, moby/client v0.4.0
>     5ddc1553ae bump version to v29.4.0-dev
>     a347d9e103 update AUTHORS and .mailmap
>     5fca671ef4 vendor: github.com/mattn/go-runewidth v0.0.22
>     42da40a605 vendor: moby/client and moby/api master
>     0029d5936a build(deps): bump codecov/codecov-action from 5.5.3 to 6.0=
.0
>     e7cbaafa9d cli/command/container: statsFormatWrite: inline render fun=
c
>     c44a4d9758 cli/command/container: RunStats: avoid bytes to strings
> conversions
>     d92d1187fc cli/command/container: RunStats: rename buffer var for
> brevity
>     ee88c60a5e cli/command/container: stats: add snapshot method
>     4c5efd61ea cli/command/container: fix buffer reuse when printing stat=
s
>     b309524f60 cli/command/formatter: NewStats: update GoDoc and add TODO
>     abd2e211b9 cli/command/formatter: add Format.templateString, remove
> Context.preFormat
>     cb615a9772 cli/command/formatter: Context.postFormat: remove redundan=
t
> buffer
>     f7a909d56b cli/command/formatter: optimize ContainerContext.Names
>     94d4929a04 cli/streams: Out, In: preserve original os.File when
> available
>     526dfffc26 cli/streams: simplify CheckTty
>     48721c2340 cli/streams: don't depend on embedding
>     39e82e6524 cli/streams: move constructors to the start
>     34805dd013 cli/streams: (In|Out).SetRawTerminal: dry
>     6e1f03c2e0 cmd/docker-trust: bump dependencies
>     87a222158d Updated example tokens in swarm docs
>     98d978df6b vendor: go.opentelemetry.io/otel v1.42.0, otel/contrib
> v1.67.0
>     a48ff6b591 cli/command/completion: don't provide duplicate completion=
s
>     091afa4957 vendor: github.com/go-jose/go-jose/v4 v4.1.4
>     968ad0ea6c vendor: golang.org/x/net v0.52.0
>     78fb018754 vendor: golang.org/x/time v0.15.0
>     18739a5ef6 vendor: golang.org/x/term v0.41.0
>     9b21846cde vendor: golang.org/x/text v0.35.0
>     c22bf3c77e vendor: golang.org/x/mod v0.34.0
>     d792fc53b7 vendor: golang.org/x/sync v0.20.0
>     e9664a72ea vendor: golang.org/x/sys v0.42.0
>     fb776458cb update to go1.26.1
>     62d80156e1 ci: pin remaining actions
>     ea74248e8e cli/command/formatter: modernize
>     5efed5fa30 vendor: github.com/klauspost/compress v1.18.5
>     cd9e5ae84f vendor: github.com/moby/patternmatcher v0.6.1
>     bf6a1e1fcf cli-plugins/socket: modernize
>     8f7dc04070 update minimum go version to go1.25
>     a14db81c9c vendor: google.golang.org/grpc v1.79.3
>     e660030f3a docs: fix typo in run reference
>     58c1585b49 gha: validate gocompat
>     ea42337d01 implement module compatibility check
>     d573c171fe docs: clarify multiple --filter behavior in prune commands
>     07bb479a45 cli-plugins/hooks: add missing "go:build" comments
>     97b9e04a94 ci: pin actions to digests
>     2bc4307816 fix(cmd/docker): prevent race between force-exit goroutine
> and plugin wait
>     9c117d3c5d cli/command/container: add shell completion for docker rm
> --link
>     df57ff7201 cli/command/completion: ContainerNames: skip legacy link
> names
>     dfda342e51 cli/command/formatter: StripNamePrefix only strip "/" pref=
ix
>     b5efd66ba6 cli/command/container: stats: make stripping "/" prefix
> deterministic
>     64c8d68045 cli/command/image: getPossibleChips: simplify
>     4bf4d567bd cli-plugins/hooks: PrintNextSteps: slight cleanup
>     dd1f7f5856 cli-plugins/hooks: simplify templating formats
>     9243240346 cli-plugins/hooks: add commandInfo type for templating
>     4a1b2ef2c5 cli-plugins/hooks: update godoc
>     4142d4026e cli-plugins/hooks: detect if templating is needed
>     cd053606a6 cli-plugins/hooks: slight tweaks in templates
>     aadfe6214f cli-plugins/hooks: update tests
>     dce201d6ee cli-plugins/hooks: move template utils separate from rende=
r
> code
>     e26f94d823 cli-plugins/hooks: add JSON labels, omitzero
>     0431e4d23c cli-plugins/hooks: rename HookType to ResponseType
>     607ebfca5d cli-plugins/hooks: rename HookMessage to Response
>     60180924e3 cli-plugins/manager: move HookPluginData to hooks.Request
>     dd91ed3f2d cli-plugins/manager: refactor for easier debugging
>     0501cf8293 cli-plugins/manager: simplify ctx-cancel check
>     5343bdc792 cli-plugins/manager: Plugin.RunHook: improve error message
>     5fb5e0b0da docker stats --all: remove containers when removed
>     560db7d451 vendor: github.com/mattn/go-runewidth v0.0.21
>     dc4abf8b99 golangci-lint: gocheckcompilerdirectives: ignore "//go:fix=
"
>     7f781688ed golangci-lint: remove outdated exclusion
>     21293265b1 cli/command/image/build: use t.Chdir() in tests
>     3f51d0a9d2 cli/command/container: RunStats: refactor to DRY
>     9645db767a cli/command/container: RunStats: pass ctx to stats event
> handlers
>     2bc66ecbc7 docker cp: report both content size and transferred size
>     33790e88d0 docs: use generic myplugin example for plugin documentatio=
n
>     6b1ba1ad84 fix: restore os.Args after plugin completion and fix error
> return
>     300d8231da feat: add linux/riscv64 to bin-image-cross release target
>     9a471180cb cli/command: add missing "go:build" comments
>     f7d83cbae8 update to go1.25.8
>     39d676c72d build(deps): bump docker/metadata-action from 5 to 6
>     6453c4c3a7 build(deps): bump docker/bake-action from 6 to 7
>     eef3c957be cli/config/credentials: ConvertToHostname: update godoc
>     71db1520de scripts/warn-outside-container: fix font representation
>     206fc8c165 vendor: github.com/moby/moby/client v0.3.0
>     874a8df0eb vendor: github.com/moby/moby/api v1.54.0
>     668b3671bd build(deps): bump docker/setup-buildx-action from 3 to 4
>     30a2ace7f2 build(deps): bump docker/login-action from 3 to 4
>     32aa575aff docs/service: Document bind-create-src
>     c747cff9ab container/opts: Add bind-create-src mount option
>     ba349f5afd build(deps): bump docker/setup-qemu-action from 3 to 4
>     e2cafd657e cli/command/registry: preserve all whitespace in secrets
>     10ebb3b204 build(deps): bump go.opentelemetry.io/otel/sdk
>     681f15674c Fix typos in code and documentation
>     0bf060f777 vendor: github.com/moby/moby/client v0.2.3-rc.1
>     139b58d7f4 vendor: github.com/moby/moby/api v1.54.0-rc.1
>     8eedbdc6a8 vendor: moby/api v1.54.0-dev, moby/client v0.2.3-dev
>     cd070a5ed5 vendor: github.com/mattn/go-runewidth v0.0.20
>     8c3d05398e Dockerfile: update mvdan.cc/gofump to v0.9.2
>     b206927e0c Dockerfile: update buildx to v0.31.1
>     6b5acd3a6e Dockerfile: update compose to v5.1.0
>     caa8a50468 vendor: github.com/klauspost/compress v1.18.4
>     5c498778ec vendor: go.opentelemetry.io/contrib v0.65.0
>     fbd0e7f7c4 vendor: go.opentelemetry.io/otel v1.40.0
>     95a5a9e709 build(deps): bump actions/upload-artifact from 6 to 7
>     a7b95f228f chore: use canonical url for buildx build cli doc
>     13c993f101 cli/compose/loader: merge: use errors.Join
>     8b6f23d18b cli/compose/loader: remove some wrapper utilities
>     b35a2d0837 cli/compose/loader: remove getLoggingDriver
>     42a211162c cli/compose/loader: mergeServices: inline mapByName
>     6e1393089b cli/compose/loader: mergeServices: remove intermediate map
> for overrides
>     78458e11e1 cli/compose/loader: mergeServices: tidy up and modernize
>     09cf89e82e cli/compose/convert: convertEndpointSpec: fix sorting of
> ports
>     db28780976 cli/compose/convert: convertUlimits: modernize
>     830d05d16e error-hooks approach
>     9bc18993a4 Fix: run plugin hooks on command failure, not just success
>     fdebf0afae cli/command/container: fix some unhandled errors in test
>     e47a5c7734 remove redundant uses of streamformatter in tests
>     2fa6b736d0 scripts/build/.variables: don't use "netgo" when building
> Windows binaries
>     61f03db682 cli/command/registry: refactor reading from stdin
>     74d4554ccd github/issues: Add emojis
>     2ebd137abc github/issues: Add links for Docker Desktop and Sandboxes
>     f5b6055bd1 cli/command/registry: add unit test for --password-stdin
>     b82e30e58d cli/command/registry: remove uses of "gotest.tools/v3/fs"
>     c4fd2406e0 e2e: use docker v29.x dind as default
>     fddfe63ef9 modernize: fmtappendf
>     6d4b3b5f66 modernize: slicescontains
>     835d510b78 modernize: stringsseq
>     dd73e2df77 modernize: reflecttypefor
>     7f5bb1e99c modernize: testingcontext
>     2875e48024 modernize: stringscut
>     4c7d40cf77 modernize: mapsloop
>     85ebca52fd modernize: minmax
>     e8dc2fce32 modernize: rangeint
>     e4f6019e62 vendor: golang.org/x/net v0.50.0
>     464e14c68e vendor: golang.org/x/term v0.40.0
>     1e31c2825e vendor: golang.org/x/text v0.34.0
>     355f7bb602 vendor: golang.org/x/sys v0.41.0
>     a934c75de7 Dockerfile: update golangci-lint to v2.9.0
>     ab06aebd4b internal/volumespec: fix prealloc linting
>     9a0c78fdc0 cli-plugins/manager: fix prealloc linting
>     2e544d6308 cli/command: fix prealloc linting
>     12a0b0b7b9 cli/compose: fix prealloc linting
>     99cef6f700 opts: fix prealloc linting
>     8a8a3e1309 opts/swarmopts: fix prealloc linting
>     9d2816c8a5 remove outdated "nolint" comments
>     eaba9ecf18 cli/connhelper/ssh: remove outdated "nolint" comment
>     1f6b319d60 Dockerfile: update alpine to 3.23
>     b598f8f0b8 docs: fix docker volume prune example
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> index 56d94675..ffd77fc0 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -44,8 +44,8 @@ DESCRIPTION =3D "Linux container runtime \
>  # so we get that tag, and make it our SRCREVS:
>  #
>
> -SRCREV_moby =3D "1da6517e1a4381297e56862f6f373f265c28d102"
> -SRCREV_cli =3D "df016a3a9538efb6d7d6e7c3baf291dbbe28eee0"
> +SRCREV_moby =3D "56be73107b381194c27938965bca74c4e2bb475b"
> +SRCREV_cli =3D "055a478ea9010a19d0d4674c0d0e87ade37a4223"
>  SRCREV_FORMAT =3D "moby"
>  SRC_URI =3D "\
>         git://
> github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttps;destsu=
ffix=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttp=
s;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
> @@ -64,7 +64,7 @@ require docker.inc
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
>
> -DOCKER_VERSION =3D "v29.3.0"
> +DOCKER_VERSION =3D "v29.4.3"
>  PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
>
>  CVE_PRODUCT =3D "docker mobyproject:moby"
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9799):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9799
> Mute This Topic: https://lists.yoctoproject.org/mt/119419709/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000dcc58f06524be7b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">This is outside of the -stable policy, as it is more than a b=
ug fix release. Only a 3rd digit bump would typically be considered for wry=
nose.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">When I get to the m=
2 update window for master, I can consider special case larger bumps to wry=
nose, but not until then. So I&#39;ve tagged this and will look at it more =
closely once master has moved past this release.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 20, 20=
26 at 9:30=E2=80=AFPM Zhixiong Chi via <a href=3D"http://lists.yoctoproject=
.org">lists.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"mailto:windr=
iver.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bumpin=
g moby to version docker-v29.4.3, which comprises the following commits:<br=
>
<br>
=C2=A0 =C2=A0 96127a375b daemon: Always reload AppArmor profile at daemon s=
tartup<br>
=C2=A0 =C2=A0 4dcaf2c1c6 vendor: <a href=3D"http://github.com/moby/profiles=
/seccomp" rel=3D"noreferrer" target=3D"_blank">github.com/moby/profiles/sec=
comp</a> v0.2.3 (Drop socketcall block)<br>
=C2=A0 =C2=A0 b8cccd63c1 integration/container: Handle socketcall return EP=
ERM<br>
=C2=A0 =C2=A0 4bce638439 vendor: <a href=3D"http://github.com/moby/profiles=
/apparmor" rel=3D"noreferrer" target=3D"_blank">github.com/moby/profiles/ap=
parmor</a> v0.2.1 (deny network alg)<br>
=C2=A0 =C2=A0 67d638fca9 integration/container: skip socketcall test withou=
t AppArmor or SELinux<br>
=C2=A0 =C2=A0 ee5ac4c7ca contrib/selinux: Add CIL policy to deny AF_ALG soc=
kets in containers<br>
=C2=A0 =C2=A0 dc7f064875 integration/container: Verify AF_INET socketcall s=
till works<br>
=C2=A0 =C2=A0 f89c5935ab integration/container: Drop i386 cross-compile soc=
ketcall test<br>
=C2=A0 =C2=A0 729750e8f1 gha/validate-milestone: Read versions.yaml from ba=
se branch<br>
=C2=A0 =C2=A0 56a72c7494 [docker-29.x] update milestone version<br>
=C2=A0 =C2=A0 becdb42e26 vendor: <a href=3D"http://github.com/moby/profiles=
/seccomp" rel=3D"noreferrer" target=3D"_blank">github.com/moby/profiles/sec=
comp</a> v0.2.2<br>
=C2=A0 =C2=A0 a1197d997e vendor: <a href=3D"http://github.com/moby/profiles=
/seccomp" rel=3D"noreferrer" target=3D"_blank">github.com/moby/profiles/sec=
comp</a> v0.2.1<br>
=C2=A0 =C2=A0 1818ec7c13 integration/container: Add socketcall AF_ALG denia=
l tests<br>
=C2=A0 =C2=A0 c7337e2430 integration/container: Add test for denied socket =
address families<br>
=C2=A0 =C2=A0 a529a27817 integration/container: Fix flaky TestContainerRest=
artWithCancelledRequest on Windows<br>
=C2=A0 =C2=A0 a65bd0440b releases: Bump patch<br>
=C2=A0 =C2=A0 34bd1ebdf4 vendor: <a href=3D"http://github.com/moby/moby/cli=
ent" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/client</a> v=
0.4.1<br>
=C2=A0 =C2=A0 b63208b64b vendor: <a href=3D"http://github.com/moby/moby/api=
" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/api</a> v1.54.2=
<br>
=C2=A0 =C2=A0 5be108f817 vendor: <a href=3D"http://github.com/sigstore/time=
stamp-authority/v2" rel=3D"noreferrer" target=3D"_blank">github.com/sigstor=
e/timestamp-authority/v2</a> v2.0.6<br>
=C2=A0 =C2=A0 727b81991c vendor: <a href=3D"http://github.com/sigstore/sigs=
tore" rel=3D"noreferrer" target=3D"_blank">github.com/sigstore/sigstore</a>=
 v1.10.5<br>
=C2=A0 =C2=A0 bad8e1b799 vendor: <a href=3D"http://github.com/go-openapi/*"=
 rel=3D"noreferrer" target=3D"_blank">github.com/go-openapi/*</a> deps<br>
=C2=A0 =C2=A0 f3cadf69dc vendor: <a href=3D"http://github.com/Azure/azure-s=
dk-for-go/sdk/azcore" rel=3D"noreferrer" target=3D"_blank">github.com/Azure=
/azure-sdk-for-go/sdk/azcore</a> v1.21.0<br>
=C2=A0 =C2=A0 5c6a343842 vendor: <a href=3D"http://google.golang.org/api" r=
el=3D"noreferrer" target=3D"_blank">google.golang.org/api</a> v0.272.0<br>
=C2=A0 =C2=A0 463f4c0943 No longer a reviewer; update email address<br>
=C2=A0 =C2=A0 98c7106fbe vendor: <a href=3D"http://github.com/hashicorp/mem=
berlist" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/memberli=
st</a> v0.5.4, hashicorp/serf v0.10.2<br>
=C2=A0 =C2=A0 f69fed1350 fix(deps): update module <a href=3D"http://github.=
com/aws/smithy-go" rel=3D"noreferrer" target=3D"_blank">github.com/aws/smit=
hy-go</a> to v1.25.0<br>
=C2=A0 =C2=A0 eb2672a3b9 chore(deps): update actions/github-script action t=
o v9<br>
=C2=A0 =C2=A0 75c2f4fb37 fix(deps): update module <a href=3D"http://go.open=
telemetry.io/contrib/processors/baggagecopy" rel=3D"noreferrer" target=3D"_=
blank">go.opentelemetry.io/contrib/processors/baggagecopy</a> to v0.16.0<br=
>
=C2=A0 =C2=A0 6fa46cf8c7 fix(deps): update <a href=3D"http://golang.org/x" =
rel=3D"noreferrer" target=3D"_blank">golang.org/x</a> packages<br>
=C2=A0 =C2=A0 0aaa2d3e3a README: Add Go modules section documenting the v29=
 module split<br>
=C2=A0 =C2=A0 68d1d1a947 vendor: <a href=3D"http://go.opentelemetry.io/cont=
rib" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/contrib</a> v=
0.68.0<br>
=C2=A0 =C2=A0 8384598603 vendor: <a href=3D"http://go.opentelemetry.io/otel=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</a> v1.43.0=
<br>
=C2=A0 =C2=A0 836b06d8da vendor: <a href=3D"http://google.golang.org/genpro=
to" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto</a> 9d3=
8bb4040a9<br>
=C2=A0 =C2=A0 0aa66fca01 fix(deps): update module <a href=3D"http://google.=
golang.org/grpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grp=
c</a> to v1.80.0<br>
=C2=A0 =C2=A0 7ab051cf89 daemon/logger/local: marshal: remove redundant res=
etProto<br>
=C2=A0 =C2=A0 23020513e6 chore(deps): update docker/github-builder action t=
o v1.6.0<br>
=C2=A0 =C2=A0 6e22bc8095 chore(deps): update docker/bake-action action to v=
7.1.0<br>
=C2=A0 =C2=A0 b1637ed54b vendor: <a href=3D"http://github.com/hashicorp/gol=
ang-lru" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/golang-l=
ru</a> v1.0.2<br>
=C2=A0 =C2=A0 d994daf576 daemon/containerd: fix label!=3D filter ignoring i=
mages without label<br>
=C2=A0 =C2=A0 c255b67c0f Update github/codeql-action action to v4.35.2<br>
=C2=A0 =C2=A0 9136afe4fe Update actions/upload-artifact action to v7.0.1<br=
>
=C2=A0 =C2=A0 dc48cea266 api/docs: cleanup changelog<br>
=C2=A0 =C2=A0 9c084cad3e ci: skip using xargs<br>
=C2=A0 =C2=A0 c621624e2f libnetwork: Always clean up endpoint driver info i=
n sbLeave<br>
=C2=A0 =C2=A0 6e9f9bc0a5 ci: fix workflow permission errors<br>
=C2=A0 =C2=A0 10b0401423 Update actions/cache action to v5.0.5<br>
=C2=A0 =C2=A0 b7e7d3f065 libnetwork: Remove montanaflynn/stats dependency<b=
r>
=C2=A0 =C2=A0 70907e2988 libnetwork: Drop golang-set dependency<br>
=C2=A0 =C2=A0 2437d5d646 ci: use bake matrix subaction<br>
=C2=A0 =C2=A0 1743957d3f fix zizmor findings<br>
=C2=A0 =C2=A0 7136f5e946 Dockerfile: update delve to v1.26.1<br>
=C2=A0 =C2=A0 0f5a7ae948 Dockerfile: update Docker CLI to v29.4.0<br>
=C2=A0 =C2=A0 270b511972 Dockerfile: update docker compose to v5.1.3<br>
=C2=A0 =C2=A0 cdb3fc279d Dockerfile: update buildx to v0.33.0<br>
=C2=A0 =C2=A0 c6d4830c14 vendor: <a href=3D"http://github.com/docker/go-con=
nections" rel=3D"noreferrer" target=3D"_blank">github.com/docker/go-connect=
ions</a> v0.7.0<br>
=C2=A0 =C2=A0 5c80a6e826 api: align Topology in versioned OpenAPI specs wit=
h Segments JSON shape<br>
=C2=A0 =C2=A0 0c878186d3 ci: zizmor workflow<br>
=C2=A0 =C2=A0 97cb71d7ed pkg/registry: use stdlib&#39;s x509.SystemCertPool=
 on Windows<br>
=C2=A0 =C2=A0 ba1f3e8aa8 Dockerfile: update containerd binary to v2.2.3, ru=
nhcs v0.14.1<br>
=C2=A0 =C2=A0 a2cdd57812 vendor: <a href=3D"http://github.com/containerd/co=
ntainerd/v2" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/con=
tainerd/v2</a> v2.2.3<br>
=C2=A0 =C2=A0 c4f4eb3f5f api: align Topology swagger with Segments JSON sha=
pe<br>
=C2=A0 =C2=A0 f8873b7796 daemon/logger: use consts for common log-options<b=
r>
=C2=A0 =C2=A0 30b7b3f919 daemon/logger: define consts for common log-option=
s<br>
=C2=A0 =C2=A0 9008249e8a daemon/logger/local: add a constructor for config<=
br>
=C2=A0 =C2=A0 33261e9a45 daemon/logger/local: unify constructors<br>
=C2=A0 =C2=A0 5d5797002d daemon/logger/local: test cleanups<br>
=C2=A0 =C2=A0 69caf3d4c7 daemon/logger/local: improve TestDecode, rename to=
 TestDecodeIncompleteRecord<br>
=C2=A0 =C2=A0 f3f3040713 daemon/logger/local: use struct-literal for pmetad=
ata<br>
=C2=A0 =C2=A0 a331d4d7a3 gha: Add milestone validation workflow<br>
=C2=A0 =C2=A0 10eb86543f Cleanup releases dir<br>
=C2=A0 =C2=A0 3b22c500d5 daemon: retry secrets dir remount on transient EBU=
SY<br>
=C2=A0 =C2=A0 0ea9255e50 daemon/logger/splunk: tryPostMessages use http.New=
RequestWithContext<br>
=C2=A0 =C2=A0 0677030570 daemon/logger: use uniform location for registerin=
g drivers<br>
=C2=A0 =C2=A0 8e79aacee6 daemon/logger/journald: remove outdated comment<br=
>
=C2=A0 =C2=A0 e0b5ab2f98 daemon/logger/loggerutils: ParseLogTag: add fast p=
ath<br>
=C2=A0 =C2=A0 3ba0b72b78 daemon/logger/loggerutils: ParseLogTag: fix panic =
and image ID<br>
=C2=A0 =C2=A0 4f2553e81a daemon/logger/loggerutils: ParseLogTag: improve te=
st-coverage<br>
=C2=A0 =C2=A0 7bfa790f2b daemon/logger/jsonfilelog: be more explicit on han=
dling optional &quot;tag&quot;<br>
=C2=A0 =C2=A0 ec909a2239 daemon/logger/jsonfilelog: JSONFileLogger: remove =
unused &quot;tag&quot; field<br>
=C2=A0 =C2=A0 6a5e00fe5f daemon/logger: Info: touch-up godoc<br>
=C2=A0 =C2=A0 1a45789c04 client: imageDiskUsageFromLegacyAPI: explicitly ex=
clude &quot;-1&quot; for containers<br>
=C2=A0 =C2=A0 25ffdb23d9 daemon: Daemon.imageDiskUsage: explicitly exclude =
&quot;-1&quot; for containers<br>
=C2=A0 =C2=A0 e0fc07b8cf gha/labeler: Only assign Windows to Windows-only c=
hanges<br>
=C2=A0 =C2=A0 b3bd13ad10 daemon/pkg/registry: minor cleanups<br>
=C2=A0 =C2=A0 377e85700f vendor: <a href=3D"http://github.com/Microsoft/hcs=
shim" rel=3D"noreferrer" target=3D"_blank">github.com/Microsoft/hcsshim</a>=
 v0.14.1<br>
=C2=A0 =C2=A0 e30a6fa93b libnetwork: respect gw priority per address family=
<br>
=C2=A0 =C2=A0 3541b0d0fd update to Go 1.26.2<br>
=C2=A0 =C2=A0 2601915b10 client/internal: touch-up godoc<br>
=C2=A0 =C2=A0 689accfe29 client/internal: fix RSFilterReader returning (0, =
nil) after filtering<br>
=C2=A0 =C2=A0 159b3317f0 client/internal: RSFilterReader: un-export, and re=
move unused buffer<br>
=C2=A0 =C2=A0 ba66582228 client/internal: Stream.JSONMessages: improve erro=
r handling<br>
=C2=A0 =C2=A0 5f08008342 client/internal: Stream.JSONMessages: move reader =
inside the func<br>
=C2=A0 =C2=A0 d5d18015e1 client/internal: Stream.Wait: return errdefs error=
s<br>
=C2=A0 =C2=A0 82ff7e9f76 client/internal: Stream.Wait: fix missing error-ha=
ndling<br>
=C2=A0 =C2=A0 4d1d9ee358 go.mod: add back replace rules<br>
=C2=A0 =C2=A0 00840cd39c ci: buildkit: pin registry to v3.0.0<br>
=C2=A0 =C2=A0 a2eaebb011 api/docs: lower deprecation heading to a h4<br>
=C2=A0 =C2=A0 f44956451a CI: add back ubuntu-24.04 + rootless<br>
=C2=A0 =C2=A0 ca69153e28 api/docs: restore changelog for API v1.0 - v1.13<b=
r>
=C2=A0 =C2=A0 1055b7a1a6 api/docs: restore API versions v1.0 - v1.13<br>
=C2=A0 =C2=A0 0d2d3f348d api/docs: restore API versions v1.14 - v1.17<br>
=C2=A0 =C2=A0 dc824e3d8d api/docs: restore API versions v1.18 - v1.23<br>
=C2=A0 =C2=A0 70043cd439 ci: fix bin-image workflow<br>
=C2=A0 =C2=A0 f42ff6a603 internal/testutil/daemon.New: cleanup test paths<b=
r>
=C2=A0 =C2=A0 7094e8c3ef integration/daemon: TestLiveRestore remove quote f=
rom test-name<br>
=C2=A0 =C2=A0 3a7e8e285e vendor: <a href=3D"http://github.com/moby/moby/cli=
ent" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/client</a> v=
0.4.0<br>
=C2=A0 =C2=A0 f8946fc137 vendor: <a href=3D"http://github.com/moby/moby/api=
" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/api</a> v1.54.1=
<br>
=C2=A0 =C2=A0 f1b420bf02 Drop replace rules<br>
=C2=A0 =C2=A0 c286d4ce13 Dockerfile: go install: use Git SourceOp<br>
=C2=A0 =C2=A0 d3a677d730 Dockerfile: use Git SourceOp<br>
=C2=A0 =C2=A0 07a5e924ce Fix typos and misspellings in comments, tests, and=
 docs<br>
=C2=A0 =C2=A0 6604bd0ddc update AUTHORS and .mailmap<br>
=C2=A0 =C2=A0 84743bdda3 client/internal/mod: swap order of &quot;ok&quot; =
bool<br>
=C2=A0 =C2=A0 9dec3bf78f daemon: include moby module version in version res=
ponse<br>
=C2=A0 =C2=A0 de68dce70d daemon/internal/mod: also check main module<br>
=C2=A0 =C2=A0 1bed74db50 daemon/internal/mod: reimplement without <a href=
=3D"http://golang.org/x/mod" rel=3D"noreferrer" target=3D"_blank">golang.or=
g/x/mod</a> dependency<br>
=C2=A0 =C2=A0 74e74ed5ee builder-next/worker: move mod package to daemon/in=
ternal<br>
=C2=A0 =C2=A0 80c22f0982 daemon: respect explicit AppArmor profile on privi=
leged containers<br>
=C2=A0 =C2=A0 b8057a3a58 api/types/network: fix handling of unmapped ports =
(ephemeral ports)<br>
=C2=A0 =C2=A0 2d35a29f63 vendor: <a href=3D"http://github.com/microsoft/hcs=
shim" rel=3D"noreferrer" target=3D"_blank">github.com/microsoft/hcsshim</a>=
 v0.14.0<br>
=C2=A0 =C2=A0 4975231ecc daemon/volume/local: New: ignore non-volume direct=
ories<br>
=C2=A0 =C2=A0 538f407103 daemon/volume/local: store path to opts.json<br>
=C2=A0 =C2=A0 5eeb08ae1c fix: use t.Cleanup to prevent goroutine leak in Te=
stCancelledUpload<br>
=C2=A0 =C2=A0 735d17e1a5 fix: return 400 instead of 500 for invalid request=
 parameters<br>
=C2=A0 =C2=A0 9aa5ac3034 client/pkg/jsonmessage: use functional options for=
 display funcs<br>
=C2=A0 =C2=A0 06b31dcd12 daemon/pkg/opts: fix ValidateIPAddress docstring<b=
r>
=C2=A0 =C2=A0 ad67096edf gha: validate-api-swagger: remove redundant &#39;m=
ake image&#39;<br>
=C2=A0 =C2=A0 8769bda667 gha: buildkit: fix go version<br>
=C2=A0 =C2=A0 e0999bd5ec update to go1.26.1<br>
=C2=A0 =C2=A0 6ddd4ff73d integration/plugin: remove redundant assert<br>
=C2=A0 =C2=A0 9295e2cd84 client: fix race in cancelReadCloser<br>
=C2=A0 =C2=A0 6bfde409bd client: fix typo: TestWithHTTTPHeaders -&gt; TestW=
ithHTTPHeaders<br>
=C2=A0 =C2=A0 72142ab278 daemon: buildSandboxOptions: warn, not panic on in=
valid extra host<br>
=C2=A0 =C2=A0 98840db4d3 daemon: Daemon.restore: trim whitespace in extra-h=
osts<br>
=C2=A0 =C2=A0 dd11127524 daemon/pkg/opts: ValidateIPAddress: use netip.Pars=
e<br>
=C2=A0 =C2=A0 333f39ce02 remove uses of jsonmessage.DisplayJSONMessagesStre=
am in tests<br>
=C2=A0 =C2=A0 6aedc6ba32 client/pkg/jsonmessage: add DisplayStream and Disp=
layMessages utils<br>
=C2=A0 =C2=A0 5672c51b00 vendor: update buildkit to v0.29.0<br>
=C2=A0 =C2=A0 abb2a31c8a daemon: Daemon.SystemVersion: align fields with ap=
i type<br>
=C2=A0 =C2=A0 65ce470c2a fix(deps): update module <a href=3D"http://github.=
com/aws/aws-sdk-go-v2/service/cloudwatchlogs" rel=3D"noreferrer" target=3D"=
_blank">github.com/aws/aws-sdk-go-v2/service/cloudwatchlogs</a> to v1.66.0<=
br>
=C2=A0 =C2=A0 281f4b6767 chore(deps): update actions/setup-go action to v6.=
4.0<br>
=C2=A0 =C2=A0 38c77a9189 daemon/libnetwork/ns: make NetlinkSocketsTimeout a=
 const<br>
=C2=A0 =C2=A0 5378f5427f daemon/libnetwork/ns: remove ParseHandlerInt, add =
NsHandle<br>
=C2=A0 =C2=A0 af73684bc3 daemon/libnetwork/ns: use sync.OnceValues<br>
=C2=A0 =C2=A0 635f4c3dc4 daemon/libnetwork/ns: remove windows stub<br>
=C2=A0 =C2=A0 579280d444 daemon/libnetwork/ns: suppress some unhandled erro=
rs<br>
=C2=A0 =C2=A0 dee7411f05 fix(libnetwork): nil pointer will cause panic<br>
=C2=A0 =C2=A0 434ec1655c daemon/volume/service: deprecate OpErr.Cause (Caus=
er interface)<br>
=C2=A0 =C2=A0 57d0f88684 golangci-lint: enable godoclint linter<br>
=C2=A0 =C2=A0 dee3c452d7 daemon/volume/local: remove duplicate package doc<=
br>
=C2=A0 =C2=A0 28aeae20dc client: WithHTTPHeaders: produce error if duplicat=
e headers are detected<br>
=C2=A0 =C2=A0 1ec892c555 client: WithHTTPHeaders: improve doc and add test =
coverage<br>
=C2=A0 =C2=A0 d7d856927b daemon: fix typo in filedescriptors filenames<br>
=C2=A0 =C2=A0 d71f3ea5da ci: fix upload sarif action<br>
=C2=A0 =C2=A0 1769b3eb5d chore(deps): update github/codeql-action action to=
 v4.35.1<br>
=C2=A0 =C2=A0 beba95c819 vendor: update buildkit to v0.29.0-rc1<br>
=C2=A0 =C2=A0 5da773a71d chore(deps): update codecov/codecov-action action =
to v6<br>
=C2=A0 =C2=A0 1293d50b38 fix(deps): update module <a href=3D"http://github.=
com/pelletier/go-toml/v2" rel=3D"noreferrer" target=3D"_blank">github.com/p=
elletier/go-toml/v2</a> to v2.3.0<br>
=C2=A0 =C2=A0 12ae6dd67e fix(deps): update module <a href=3D"http://github.=
com/montanaflynn/stats" rel=3D"noreferrer" target=3D"_blank">github.com/mon=
tanaflynn/stats</a> to v0.9.0<br>
=C2=A0 =C2=A0 3fa5ec578b chore(deps): update github/codeql-action action to=
 v4.34.1<br>
=C2=A0 =C2=A0 0c7f2b3d38 chore(deps): update codecov/codecov-action action =
to v5.5.4<br>
=C2=A0 =C2=A0 c66815426c chore(deps): update docker/github-builder action t=
o v1.4.0<br>
=C2=A0 =C2=A0 615cf6345f chore(deps): update actions/setup-go action to v6.=
3.0<br>
=C2=A0 =C2=A0 fb146a3806 fix(deps): update aws-sdk-go-v2 monorepo<br>
=C2=A0 =C2=A0 c36e70524b chore(deps): update actions/labeler action to v6.0=
.1<br>
=C2=A0 =C2=A0 0d0751397d Dockerfile: update runc binary to v1.3.5<br>
=C2=A0 =C2=A0 96343dd0b5 chore(deps): update actions/download-artifact acti=
on to v8.0.1<br>
=C2=A0 =C2=A0 49a4a47df5 chore(deps): update actions/checkout action to v6.=
0.2<br>
=C2=A0 =C2=A0 45ec277dd5 vendor: <a href=3D"http://go.opentelemetry.io/otel=
/exporters" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel/e=
xporters</a> v1.42.0<br>
=C2=A0 =C2=A0 bb79587d84 fix(deps): update opentelemetry-go-contrib monorep=
o<br>
=C2=A0 =C2=A0 ce7b3aaa0e chore(deps): update actions/cache action to v5.0.4=
<br>
=C2=A0 =C2=A0 f7e4fff10b docs: fix remaining broken links in contributing d=
ocs<br>
=C2=A0 =C2=A0 9e26694618 vendor: <a href=3D"http://github.com/moby/policy-h=
elpers" rel=3D"noreferrer" target=3D"_blank">github.com/moby/policy-helpers=
</a> b7c0b994300b<br>
=C2=A0 =C2=A0 044d59bbd1 Dockerfile: use set -x in here-docs for visibility=
 in build-logs<br>
=C2=A0 =C2=A0 695e8b3074 vendor: <a href=3D"http://golang.org/x/tools" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/tools</a> v0.43.0<br>
=C2=A0 =C2=A0 e18b58d6a4 vendor: <a href=3D"http://golang.org/x/oauth2" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/oauth2</a> v0.36.0<br>
=C2=A0 =C2=A0 cb3065011c vendor: <a href=3D"http://golang.org/x/mod" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/mod</a> v0.34.0<br>
=C2=A0 =C2=A0 c02c294e81 vendor: <a href=3D"http://golang.org/x/net" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.52.0<br>
=C2=A0 =C2=A0 7b9fe27a4d vendor: <a href=3D"http://golang.org/x/time" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/time</a> v0.15.0<br>
=C2=A0 =C2=A0 07304a4ffc vendor: <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.35.0<br>
=C2=A0 =C2=A0 37ece0f46e vendor: <a href=3D"http://golang.org/x/sync" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> v0.20.0<br>
=C2=A0 =C2=A0 c0e612d623 vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.42.0<br>
=C2=A0 =C2=A0 21d4e2525a fix(deps): update opentelemetry-go monorepo to v1.=
42.0<br>
=C2=A0 =C2=A0 dcbc18d954 fix(deps): update module <a href=3D"http://github.=
com/aws/smithy-go" rel=3D"noreferrer" target=3D"_blank">github.com/aws/smit=
hy-go</a> to v1.24.2<br>
=C2=A0 =C2=A0 b24c8272e5 go fix &quot;omitempty&quot;<br>
=C2=A0 =C2=A0 f7aea04bb3 go fix (GOOS=3Dlinux and windows)<br>
=C2=A0 =C2=A0 5cf47c0d15 pkg/plugins/pluginrpc-gen: go fix, and tidy up<br>
=C2=A0 =C2=A0 91cd097119 docs: fix broken docker docs links in CONTRIBUTING=
.md<br>
=C2=A0 =C2=A0 701ea1cb6b vendor: update buildkit to v0.28.1<br>
=C2=A0 =C2=A0 830ddb26a2 vendor: update buildkit to v0.28.1<br>
=C2=A0 =C2=A0 c7fdc58b04 ci: pin all actions<br>
=C2=A0 =C2=A0 5ba08b6ff1 chore(deps): update docker/setup-qemu-action actio=
n to v4<br>
=C2=A0 =C2=A0 db1af4f6f9 chore(deps): update docker/setup-buildx-action act=
ion to v4<br>
=C2=A0 =C2=A0 b588d1a594 ci: pin all actions<br>
=C2=A0 =C2=A0 f4d6f25bf0 plugin: Fix off-by-one in privilege validation<br>
=C2=A0 =C2=A0 99a095ecf0 plugin: Fix off-by-one in privilege validation<br>
=C2=A0 =C2=A0 f302d06687 pkg/authz: Increase body limit to 4 MiB<br>
=C2=A0 =C2=A0 7a40298211 pkg/authz: Reject requests exceeding body size lim=
it<br>
=C2=A0 =C2=A0 6f80a57b4f chore(deps): update docker/setup-qemu-action actio=
n to v4<br>
=C2=A0 =C2=A0 849efd0d3e chore(deps): update docker/setup-buildx-action act=
ion to v4<br>
=C2=A0 =C2=A0 ec76e94183 pkg/authz: Increase body limit to 4 MiB<br>
=C2=A0 =C2=A0 7a767b27fd pkg/authz: Reject requests exceeding body size lim=
it<br>
=C2=A0 =C2=A0 b66b2f77e0 ci: renovate: pin actions to digests<br>
=C2=A0 =C2=A0 f848306ce3 vendor: <a href=3D"http://github.com/moby/patternm=
atcher" rel=3D"noreferrer" target=3D"_blank">github.com/moby/patternmatcher=
</a> v0.6.1<br>
=C2=A0 =C2=A0 e1c0b3d487 Dockerfile: update containerd to v2.2.2<br>
=C2=A0 =C2=A0 a9dbf50521 ci: update docker/bake-action v7<br>
=C2=A0 =C2=A0 ef08116394 update to go1.25.8<br>
=C2=A0 =C2=A0 b9e4f34371 ci: module-replace: ignore Dockerfile for api chan=
ges<br>
=C2=A0 =C2=A0 1175d707ad vendor: <a href=3D"http://github.com/containerd/tt=
rpc" rel=3D"noreferrer" target=3D"_blank">github.com/containerd/ttrpc</a> v=
1.2.8<br>
=C2=A0 =C2=A0 968fb5787c daemon: restore: register containers without rwlay=
er<br>
=C2=A0 =C2=A0 1bd71d5d87 vendor: <a href=3D"http://github.com/moby/patternm=
atcher" rel=3D"noreferrer" target=3D"_blank">github.com/moby/patternmatcher=
</a> v0.6.1<br>
=C2=A0 =C2=A0 391789a6e1 vendor: <a href=3D"http://github.com/klauspost/com=
press" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress</=
a> v1.18.5<br>
=C2=A0 =C2=A0 435fd64319 client: fix TestNewClientWithOpsFromEnv<br>
=C2=A0 =C2=A0 673e2e2467 client: WithTraceProvider don&#39;t wrap WithTrace=
Options<br>
=C2=A0 =C2=A0 760f375400 client: WithTLSClientConfig, WithTLSClientConfigFr=
omEnv: touch-up docs<br>
=C2=A0 =C2=A0 d85e410aa6 daemon/containerd: register Sigstore media type pr=
efixes to suppress unknown-type warnings<br>
=C2=A0 =C2=A0 619ecc9b53 transport: enable HTTP keep-alive for registry con=
nections<br>
=C2=A0 =C2=A0 26d0774539 integration: ignore container Status field in Disk=
Usage test comparisons<br>
=C2=A0 =C2=A0 d74953b829 fix(deps): update module <a href=3D"http://cloud.g=
oogle.com/go/logging" rel=3D"noreferrer" target=3D"_blank">cloud.google.com=
/go/logging</a> to v1.13.2<br>
=C2=A0 =C2=A0 5220d603f9 chore(deps): update docker/compose-bin docker tag =
to v5.1.1<br>
=C2=A0 =C2=A0 04c1d25809 daemon/internal/containerfs: Retry on ENOTEMPTY er=
ror during directory deletion<br>
=C2=A0 =C2=A0 46dba49ec8 Fix reclaimable image disk usage calculation for i=
n-use images<br>
=C2=A0 =C2=A0 a17a5647f8 fix(deps): update module <a href=3D"http://google.=
golang.org/grpc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grp=
c</a> to v1.79.3 [security]<br>
=C2=A0 =C2=A0 3cb98cb1b3 ci: update docker/bake-action v7<br>
=C2=A0 =C2=A0 7d06c6c502 add example for go fix<br>
=C2=A0 =C2=A0 20f84d21ee client: add //go:fix inline directives to deprecat=
ed functions<br>
=C2=A0 =C2=A0 d0a29867e7 api/types/strslice: add //go:fix inline directives=
 for deprecated type<br>
=C2=A0 =C2=A0 8582136c90 golanci-lint: gocheckcompilerdirectives: ignore &q=
uot;//go:fix&quot;<br>
=C2=A0 =C2=A0 28b29bd8b0 builder-next: replace duplicated oneOffProgress wi=
th progress.OneOff<br>
=C2=A0 =C2=A0 b5bc84bec3 Fix issue moby#48093: set SystemTemp environment v=
ariable On Windows also set the SystemTemp environment variable, because fo=
r system processes GetTempPath2() uses it rather than TEMP/TMP: <a href=3D"=
https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-gett=
emppath2w" rel=3D"noreferrer" target=3D"_blank">https://learn.microsoft.com=
/en-us/windows/win32/api/fileapi/nf-fileapi-gettemppath2w</a><br>
=C2=A0 =C2=A0 f04f350568 dockerd-rootless.sh: check containerd-rootless.sh =
conflict<br>
=C2=A0 =C2=A0 405a787917 daemon/server: don&#39;t log context cancelation a=
s error<br>
=C2=A0 =C2=A0 f401a9678b daemon/server/backend: ContainerLogsOptions: use t=
ime.Time for since, until<br>
=C2=A0 =C2=A0 210cdcbd46 daemon/server/router: fix &quot;no stream selected=
&quot; error and status<br>
=C2=A0 =C2=A0 568312cb85 daemon/internal/timestamp: replace ParseTimestamps=
 with ParseUnixTimestamp<br>
=C2=A0 =C2=A0 cfeceed9c0 daemon/internal/timestamp: improve unix timestamp =
parsing<br>
=C2=A0 =C2=A0 553420b8f3 daemon/internal/timestamp: replace GetTimestamp fo=
r Parse<br>
=C2=A0 =C2=A0 fc3cb00398 daemon/internal/timestamp: don&#39;t return value =
on err<br>
=C2=A0 =C2=A0 f37fc9fb63 daemon/internal/timestamp: use table-tests<br>
=C2=A0 =C2=A0 282297aa0c daemon/internal: GetTimestamp: don&#39;t discard n=
anosecs, and trim zero<br>
=C2=A0 =C2=A0 8f8b23c729 daemon: fix some untyped &quot;invalid parameter&q=
uot; errors<br>
=C2=A0 =C2=A0 2d0676b8bb daemon: prevent invalid swarm events from unknown =
action kinds<br>
=C2=A0 =C2=A0 3debf539c0 fix: typos in comments<br>
=C2=A0 =C2=A0 480df69696 update to go1.25.6<br>
=C2=A0 =C2=A0 ff5e19865b ci: Remove concurrency setting from golangci-lint =
config<br>
=C2=A0 =C2=A0 01fc4fcf8b libnetwork: fix graceful service endpoint removal<=
br>
=C2=A0 =C2=A0 3eca177282 daemon/libnetwork: Fix panic in findHNSEp when IP =
networks are nil<br>
=C2=A0 =C2=A0 c4f4c6765e daemon/volumes: More fs friendly image mount layer=
 names<br>
=C2=A0 =C2=A0 a1f7fff7a9 daemon/layer_store: Use named return error for def=
er<br>
=C2=A0 =C2=A0 0e600c7fc4 layer: Clean up init layer if initialization fails=
<br>
=C2=A0 =C2=A0 734bb626e4 remove uses of deprecated go-archive consts<br>
=C2=A0 =C2=A0 5eaae6db52 layer: Clean up RW layer if mount metadata save fa=
ils<br>
=C2=A0 =C2=A0 8ebb104e36 vendor: <a href=3D"http://github.com/moby/buildkit=
" rel=3D"noreferrer" target=3D"_blank">github.com/moby/buildkit</a> v0.26.3=
<br>
=C2=A0 =C2=A0 518779c90b layer: Fix orphan creation in registerWithDescript=
or<br>
=C2=A0 =C2=A0 5a99e1d1a4 vendor: <a href=3D"http://github.com/containernetw=
orking/plugins" rel=3D"noreferrer" target=3D"_blank">github.com/containerne=
tworking/plugins</a> v1.9.0<br>
=C2=A0 =C2=A0 298e2f7d52 daemon: disallow container port 0<br>
=C2=A0 =C2=A0 3376758770 daemon: clean up dead containers on start<br>
=C2=A0 =C2=A0 bb2e099c3a daemon/container: Container.BackfillEmptyPBs: prev=
ent nil map<br>
=C2=A0 =C2=A0 5898ee60f4 daemon: buildCreateEndpointOptions: fix panic with=
 &quot;publish all&quot;<br>
=C2=A0 =C2=A0 ab55325b58 gha: Fix PR branch validation<br>
=C2=A0 =C2=A0 6280a80f32 Allow configured address with no configured subnet=
<br>
=C2=A0 =C2=A0 9cbafeac46 Update docker-py in test-docker-py<br>
=C2=A0 =C2=A0 3c6e5f0f5a Restore missing nwEndpointsMu.Lock<br>
=C2=A0 =C2=A0 7faaa44e18 Don&#39;t try to remove cleared docker_gwbridge en=
dpoint<br>
=C2=A0 =C2=A0 43f91f775a integration: skip TestBuildWithHugeFile<br>
=C2=A0 =C2=A0 bb0d79cb1a rootless: ignore error when enabling IPv6 forwardi=
ng<br>
=C2=A0 =C2=A0 2ad480ccf5 vendor: <a href=3D"http://github.com/ishidawataru/=
sctp" rel=3D"noreferrer" target=3D"_blank">github.com/ishidawataru/sctp</a>=
 v0.0.0-20251114114122-1<br>
=C2=A0 =C2=A0 3076530aa6 daemon: Fix image store choice priority for prior =
graphdriver state<br>
=C2=A0 =C2=A0 7a3cdd2c86 daemon: Add TestDetermineImageStoreChoice<br>
=C2=A0 =C2=A0 d7b6f3a7d3 inte/networking: TestDisableIPv6OnInterface: add &=
#39;-c1&#39; to ping<br>
=C2=A0 =C2=A0 7f5694cda1 inte/networking: test DNS resolution for non swarm=
-scoped nws<br>
=C2=A0 =C2=A0 0e2d804e48 libnet: create DNS records on sbJoin (if not agent=
 node)<br>
=C2=A0 =C2=A0 7242ccd7a0 c8d/builder-next: Don&#39;t force unpack<br>
=C2=A0 =C2=A0 b6705d5e1a hack/test/unit: Fix api and client module testing =
without replace rules<br>
<br>
Bumping docker/cli to v29.4.3, which comprises the following commits:<br>
<br>
=C2=A0 =C2=A0 d0f5b279e9 cmd/docker-trust: bump moby/client v0.4.1, moby/ap=
i v1.54.2<br>
=C2=A0 =C2=A0 b7f37e86da vendor: <a href=3D"http://github.com/moby/moby/cli=
ent" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/client</a> v=
0.4.1, moby/api v1.54.2<br>
=C2=A0 =C2=A0 266f039bb5 Dockerfile: update compose to v5.1.3<br>
=C2=A0 =C2=A0 d74d3c3b16 Dockerfile: update buildx to v0.33.0<br>
=C2=A0 =C2=A0 58a7c3155b golangci-lint: fix lint failures from v2.10.1 upgr=
ade<br>
=C2=A0 =C2=A0 f37a9e663f Dockerfile: update golangci-lint to v2.10.1<br>
=C2=A0 =C2=A0 ee56098b07 cmd/docker-trust: bump dependencies<br>
=C2=A0 =C2=A0 efbbc0c68c gha: Add milestone validation workflow<br>
=C2=A0 =C2=A0 a75ab98e43 vendor: <a href=3D"http://github.com/mattn/go-rune=
width" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-runewidth</=
a> v0.0.23<br>
=C2=A0 =C2=A0 b9549d3ab5 vendor: <a href=3D"http://golang.org/x/net" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.53.0<br>
=C2=A0 =C2=A0 2edf815a80 vendor: <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> v0.42.0<br>
=C2=A0 =C2=A0 258010c788 vendor: <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.36.0<br>
=C2=A0 =C2=A0 cfa80d8644 vendor: <a href=3D"http://golang.org/x/mod" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/mod</a> v0.35.0<br>
=C2=A0 =C2=A0 c20b2479e0 vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.43.0<br>
=C2=A0 =C2=A0 573dd31bf7 vendor: <a href=3D"http://github.com/docker/docker=
-credential-helpers" rel=3D"noreferrer" target=3D"_blank">github.com/docker=
/docker-credential-helpers</a> v0.9.6<br>
=C2=A0 =C2=A0 2988338b99 docs/reference: remove deprecated &quot;--kernel-m=
emory&quot; flag<br>
=C2=A0 =C2=A0 58c7328df6 man: remove deprecated &quot;--kernel-memory&quot;=
 flag<br>
=C2=A0 =C2=A0 5468871a02 contrib/completion: remove deprecated &quot;--kern=
el-memory&quot; flags<br>
=C2=A0 =C2=A0 acbbeb3c3a docs: refresh legacy plugin references<br>
=C2=A0 =C2=A0 3362ae31d0 vendor: <a href=3D"http://go.opentelemetry.io/cont=
rib" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/contrib</a> v=
0.68.0<br>
=C2=A0 =C2=A0 a1edb22832 vendor: <a href=3D"http://go.opentelemetry.io/otel=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</a> v1.43.0=
<br>
=C2=A0 =C2=A0 0a24da3382 vendor: <a href=3D"http://google.golang.org/grpc" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.80.0<br>
=C2=A0 =C2=A0 f24c779887 vendor: <a href=3D"http://google.golang.org/genpro=
to/*" rel=3D"noreferrer" target=3D"_blank">google.golang.org/genproto/*</a>=
 9d38bb4040a9<br>
=C2=A0 =C2=A0 99aaff1807 build(deps): bump actions/upload-artifact from 7.0=
.0 to 7.0.1<br>
=C2=A0 =C2=A0 f3c060c382 build(deps): bump docker/bake-action from 7.0.0 to=
 7.1.0<br>
=C2=A0 =C2=A0 b9a052a987 vendor: <a href=3D"http://github.com/docker/go-con=
nections" rel=3D"noreferrer" target=3D"_blank">github.com/docker/go-connect=
ions</a> v0.7.0<br>
=C2=A0 =C2=A0 0d32fde8e3 internal/registry: use stdlib&#39;s x509.SystemCer=
tPool on Windows<br>
=C2=A0 =C2=A0 ad641e5d61 cmd/docker-trust: use stdlib&#39;s x509.SystemCert=
Pool on Windows<br>
=C2=A0 =C2=A0 14aa781767 build(deps): bump docker/login-action from 4.0.0 t=
o 4.1.0<br>
=C2=A0 =C2=A0 d1920f0b2c update to Go 1.26.2<br>
=C2=A0 =C2=A0 b23c1a2d76 build(deps): bump github/codeql-action from 4.34.1=
 to 4.35.1<br>
=C2=A0 =C2=A0 c88681f8d8 vendor: moby/api v1.54.1, moby/client v0.4.0<br>
=C2=A0 =C2=A0 5ddc1553ae bump version to v29.4.0-dev<br>
=C2=A0 =C2=A0 a347d9e103 update AUTHORS and .mailmap<br>
=C2=A0 =C2=A0 5fca671ef4 vendor: <a href=3D"http://github.com/mattn/go-rune=
width" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-runewidth</=
a> v0.0.22<br>
=C2=A0 =C2=A0 42da40a605 vendor: moby/client and moby/api master<br>
=C2=A0 =C2=A0 0029d5936a build(deps): bump codecov/codecov-action from 5.5.=
3 to 6.0.0<br>
=C2=A0 =C2=A0 e7cbaafa9d cli/command/container: statsFormatWrite: inline re=
nder func<br>
=C2=A0 =C2=A0 c44a4d9758 cli/command/container: RunStats: avoid bytes to st=
rings conversions<br>
=C2=A0 =C2=A0 d92d1187fc cli/command/container: RunStats: rename buffer var=
 for brevity<br>
=C2=A0 =C2=A0 ee88c60a5e cli/command/container: stats: add snapshot method<=
br>
=C2=A0 =C2=A0 4c5efd61ea cli/command/container: fix buffer reuse when print=
ing stats<br>
=C2=A0 =C2=A0 b309524f60 cli/command/formatter: NewStats: update GoDoc and =
add TODO<br>
=C2=A0 =C2=A0 abd2e211b9 cli/command/formatter: add Format.templateString, =
remove Context.preFormat<br>
=C2=A0 =C2=A0 cb615a9772 cli/command/formatter: Context.postFormat: remove =
redundant buffer<br>
=C2=A0 =C2=A0 f7a909d56b cli/command/formatter: optimize ContainerContext.N=
ames<br>
=C2=A0 =C2=A0 94d4929a04 cli/streams: Out, In: preserve original os.File wh=
en available<br>
=C2=A0 =C2=A0 526dfffc26 cli/streams: simplify CheckTty<br>
=C2=A0 =C2=A0 48721c2340 cli/streams: don&#39;t depend on embedding<br>
=C2=A0 =C2=A0 39e82e6524 cli/streams: move constructors to the start<br>
=C2=A0 =C2=A0 34805dd013 cli/streams: (In|Out).SetRawTerminal: dry<br>
=C2=A0 =C2=A0 6e1f03c2e0 cmd/docker-trust: bump dependencies<br>
=C2=A0 =C2=A0 87a222158d Updated example tokens in swarm docs<br>
=C2=A0 =C2=A0 98d978df6b vendor: <a href=3D"http://go.opentelemetry.io/otel=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</a> v1.42.0=
, otel/contrib v1.67.0<br>
=C2=A0 =C2=A0 a48ff6b591 cli/command/completion: don&#39;t provide duplicat=
e completions<br>
=C2=A0 =C2=A0 091afa4957 vendor: <a href=3D"http://github.com/go-jose/go-jo=
se/v4" rel=3D"noreferrer" target=3D"_blank">github.com/go-jose/go-jose/v4</=
a> v4.1.4<br>
=C2=A0 =C2=A0 968ad0ea6c vendor: <a href=3D"http://golang.org/x/net" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.52.0<br>
=C2=A0 =C2=A0 78fb018754 vendor: <a href=3D"http://golang.org/x/time" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/time</a> v0.15.0<br>
=C2=A0 =C2=A0 18739a5ef6 vendor: <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> v0.41.0<br>
=C2=A0 =C2=A0 9b21846cde vendor: <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.35.0<br>
=C2=A0 =C2=A0 c22bf3c77e vendor: <a href=3D"http://golang.org/x/mod" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/mod</a> v0.34.0<br>
=C2=A0 =C2=A0 d792fc53b7 vendor: <a href=3D"http://golang.org/x/sync" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> v0.20.0<br>
=C2=A0 =C2=A0 e9664a72ea vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.42.0<br>
=C2=A0 =C2=A0 fb776458cb update to go1.26.1<br>
=C2=A0 =C2=A0 62d80156e1 ci: pin remaining actions<br>
=C2=A0 =C2=A0 ea74248e8e cli/command/formatter: modernize<br>
=C2=A0 =C2=A0 5efed5fa30 vendor: <a href=3D"http://github.com/klauspost/com=
press" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress</=
a> v1.18.5<br>
=C2=A0 =C2=A0 cd9e5ae84f vendor: <a href=3D"http://github.com/moby/patternm=
atcher" rel=3D"noreferrer" target=3D"_blank">github.com/moby/patternmatcher=
</a> v0.6.1<br>
=C2=A0 =C2=A0 bf6a1e1fcf cli-plugins/socket: modernize<br>
=C2=A0 =C2=A0 8f7dc04070 update minimum go version to go1.25<br>
=C2=A0 =C2=A0 a14db81c9c vendor: <a href=3D"http://google.golang.org/grpc" =
rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.79.3<br>
=C2=A0 =C2=A0 e660030f3a docs: fix typo in run reference<br>
=C2=A0 =C2=A0 58c1585b49 gha: validate gocompat<br>
=C2=A0 =C2=A0 ea42337d01 implement module compatibility check<br>
=C2=A0 =C2=A0 d573c171fe docs: clarify multiple --filter behavior in prune =
commands<br>
=C2=A0 =C2=A0 07bb479a45 cli-plugins/hooks: add missing &quot;go:build&quot=
; comments<br>
=C2=A0 =C2=A0 97b9e04a94 ci: pin actions to digests<br>
=C2=A0 =C2=A0 2bc4307816 fix(cmd/docker): prevent race between force-exit g=
oroutine and plugin wait<br>
=C2=A0 =C2=A0 9c117d3c5d cli/command/container: add shell completion for do=
cker rm --link<br>
=C2=A0 =C2=A0 df57ff7201 cli/command/completion: ContainerNames: skip legac=
y link names<br>
=C2=A0 =C2=A0 dfda342e51 cli/command/formatter: StripNamePrefix only strip =
&quot;/&quot; prefix<br>
=C2=A0 =C2=A0 b5efd66ba6 cli/command/container: stats: make stripping &quot=
;/&quot; prefix deterministic<br>
=C2=A0 =C2=A0 64c8d68045 cli/command/image: getPossibleChips: simplify<br>
=C2=A0 =C2=A0 4bf4d567bd cli-plugins/hooks: PrintNextSteps: slight cleanup<=
br>
=C2=A0 =C2=A0 dd1f7f5856 cli-plugins/hooks: simplify templating formats<br>
=C2=A0 =C2=A0 9243240346 cli-plugins/hooks: add commandInfo type for templa=
ting<br>
=C2=A0 =C2=A0 4a1b2ef2c5 cli-plugins/hooks: update godoc<br>
=C2=A0 =C2=A0 4142d4026e cli-plugins/hooks: detect if templating is needed<=
br>
=C2=A0 =C2=A0 cd053606a6 cli-plugins/hooks: slight tweaks in templates<br>
=C2=A0 =C2=A0 aadfe6214f cli-plugins/hooks: update tests<br>
=C2=A0 =C2=A0 dce201d6ee cli-plugins/hooks: move template utils separate fr=
om render code<br>
=C2=A0 =C2=A0 e26f94d823 cli-plugins/hooks: add JSON labels, omitzero<br>
=C2=A0 =C2=A0 0431e4d23c cli-plugins/hooks: rename HookType to ResponseType=
<br>
=C2=A0 =C2=A0 607ebfca5d cli-plugins/hooks: rename HookMessage to Response<=
br>
=C2=A0 =C2=A0 60180924e3 cli-plugins/manager: move HookPluginData to hooks.=
Request<br>
=C2=A0 =C2=A0 dd91ed3f2d cli-plugins/manager: refactor for easier debugging=
<br>
=C2=A0 =C2=A0 0501cf8293 cli-plugins/manager: simplify ctx-cancel check<br>
=C2=A0 =C2=A0 5343bdc792 cli-plugins/manager: Plugin.RunHook: improve error=
 message<br>
=C2=A0 =C2=A0 5fb5e0b0da docker stats --all: remove containers when removed=
<br>
=C2=A0 =C2=A0 560db7d451 vendor: <a href=3D"http://github.com/mattn/go-rune=
width" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-runewidth</=
a> v0.0.21<br>
=C2=A0 =C2=A0 dc4abf8b99 golangci-lint: gocheckcompilerdirectives: ignore &=
quot;//go:fix&quot;<br>
=C2=A0 =C2=A0 7f781688ed golangci-lint: remove outdated exclusion<br>
=C2=A0 =C2=A0 21293265b1 cli/command/image/build: use t.Chdir() in tests<br=
>
=C2=A0 =C2=A0 3f51d0a9d2 cli/command/container: RunStats: refactor to DRY<b=
r>
=C2=A0 =C2=A0 9645db767a cli/command/container: RunStats: pass ctx to stats=
 event handlers<br>
=C2=A0 =C2=A0 2bc66ecbc7 docker cp: report both content size and transferre=
d size<br>
=C2=A0 =C2=A0 33790e88d0 docs: use generic myplugin example for plugin docu=
mentation<br>
=C2=A0 =C2=A0 6b1ba1ad84 fix: restore os.Args after plugin completion and f=
ix error return<br>
=C2=A0 =C2=A0 300d8231da feat: add linux/riscv64 to bin-image-cross release=
 target<br>
=C2=A0 =C2=A0 9a471180cb cli/command: add missing &quot;go:build&quot; comm=
ents<br>
=C2=A0 =C2=A0 f7d83cbae8 update to go1.25.8<br>
=C2=A0 =C2=A0 39d676c72d build(deps): bump docker/metadata-action from 5 to=
 6<br>
=C2=A0 =C2=A0 6453c4c3a7 build(deps): bump docker/bake-action from 6 to 7<b=
r>
=C2=A0 =C2=A0 eef3c957be cli/config/credentials: ConvertToHostname: update =
godoc<br>
=C2=A0 =C2=A0 71db1520de scripts/warn-outside-container: fix font represent=
ation<br>
=C2=A0 =C2=A0 206fc8c165 vendor: <a href=3D"http://github.com/moby/moby/cli=
ent" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/client</a> v=
0.3.0<br>
=C2=A0 =C2=A0 874a8df0eb vendor: <a href=3D"http://github.com/moby/moby/api=
" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/api</a> v1.54.0=
<br>
=C2=A0 =C2=A0 668b3671bd build(deps): bump docker/setup-buildx-action from =
3 to 4<br>
=C2=A0 =C2=A0 30a2ace7f2 build(deps): bump docker/login-action from 3 to 4<=
br>
=C2=A0 =C2=A0 32aa575aff docs/service: Document bind-create-src<br>
=C2=A0 =C2=A0 c747cff9ab container/opts: Add bind-create-src mount option<b=
r>
=C2=A0 =C2=A0 ba349f5afd build(deps): bump docker/setup-qemu-action from 3 =
to 4<br>
=C2=A0 =C2=A0 e2cafd657e cli/command/registry: preserve all whitespace in s=
ecrets<br>
=C2=A0 =C2=A0 10ebb3b204 build(deps): bump <a href=3D"http://go.opentelemet=
ry.io/otel/sdk" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/ot=
el/sdk</a><br>
=C2=A0 =C2=A0 681f15674c Fix typos in code and documentation<br>
=C2=A0 =C2=A0 0bf060f777 vendor: <a href=3D"http://github.com/moby/moby/cli=
ent" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/client</a> v=
0.2.3-rc.1<br>
=C2=A0 =C2=A0 139b58d7f4 vendor: <a href=3D"http://github.com/moby/moby/api=
" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby/api</a> v1.54.0=
-rc.1<br>
=C2=A0 =C2=A0 8eedbdc6a8 vendor: moby/api v1.54.0-dev, moby/client v0.2.3-d=
ev<br>
=C2=A0 =C2=A0 cd070a5ed5 vendor: <a href=3D"http://github.com/mattn/go-rune=
width" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-runewidth</=
a> v0.0.20<br>
=C2=A0 =C2=A0 8c3d05398e Dockerfile: update <a href=3D"http://mvdan.cc/gofu=
mp" rel=3D"noreferrer" target=3D"_blank">mvdan.cc/gofump</a> to v0.9.2<br>
=C2=A0 =C2=A0 b206927e0c Dockerfile: update buildx to v0.31.1<br>
=C2=A0 =C2=A0 6b5acd3a6e Dockerfile: update compose to v5.1.0<br>
=C2=A0 =C2=A0 caa8a50468 vendor: <a href=3D"http://github.com/klauspost/com=
press" rel=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress</=
a> v1.18.4<br>
=C2=A0 =C2=A0 5c498778ec vendor: <a href=3D"http://go.opentelemetry.io/cont=
rib" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/contrib</a> v=
0.65.0<br>
=C2=A0 =C2=A0 fbd0e7f7c4 vendor: <a href=3D"http://go.opentelemetry.io/otel=
" rel=3D"noreferrer" target=3D"_blank">go.opentelemetry.io/otel</a> v1.40.0=
<br>
=C2=A0 =C2=A0 95a5a9e709 build(deps): bump actions/upload-artifact from 6 t=
o 7<br>
=C2=A0 =C2=A0 a7b95f228f chore: use canonical url for buildx build cli doc<=
br>
=C2=A0 =C2=A0 13c993f101 cli/compose/loader: merge: use errors.Join<br>
=C2=A0 =C2=A0 8b6f23d18b cli/compose/loader: remove some wrapper utilities<=
br>
=C2=A0 =C2=A0 b35a2d0837 cli/compose/loader: remove getLoggingDriver<br>
=C2=A0 =C2=A0 42a211162c cli/compose/loader: mergeServices: inline mapByNam=
e<br>
=C2=A0 =C2=A0 6e1393089b cli/compose/loader: mergeServices: remove intermed=
iate map for overrides<br>
=C2=A0 =C2=A0 78458e11e1 cli/compose/loader: mergeServices: tidy up and mod=
ernize<br>
=C2=A0 =C2=A0 09cf89e82e cli/compose/convert: convertEndpointSpec: fix sort=
ing of ports<br>
=C2=A0 =C2=A0 db28780976 cli/compose/convert: convertUlimits: modernize<br>
=C2=A0 =C2=A0 830d05d16e error-hooks approach<br>
=C2=A0 =C2=A0 9bc18993a4 Fix: run plugin hooks on command failure, not just=
 success<br>
=C2=A0 =C2=A0 fdebf0afae cli/command/container: fix some unhandled errors i=
n test<br>
=C2=A0 =C2=A0 e47a5c7734 remove redundant uses of streamformatter in tests<=
br>
=C2=A0 =C2=A0 2fa6b736d0 scripts/build/.variables: don&#39;t use &quot;netg=
o&quot; when building Windows binaries<br>
=C2=A0 =C2=A0 61f03db682 cli/command/registry: refactor reading from stdin<=
br>
=C2=A0 =C2=A0 74d4554ccd github/issues: Add emojis<br>
=C2=A0 =C2=A0 2ebd137abc github/issues: Add links for Docker Desktop and Sa=
ndboxes<br>
=C2=A0 =C2=A0 f5b6055bd1 cli/command/registry: add unit test for --password=
-stdin<br>
=C2=A0 =C2=A0 b82e30e58d cli/command/registry: remove uses of &quot;gotest.=
tools/v3/fs&quot;<br>
=C2=A0 =C2=A0 c4fd2406e0 e2e: use docker v29.x dind as default<br>
=C2=A0 =C2=A0 fddfe63ef9 modernize: fmtappendf<br>
=C2=A0 =C2=A0 6d4b3b5f66 modernize: slicescontains<br>
=C2=A0 =C2=A0 835d510b78 modernize: stringsseq<br>
=C2=A0 =C2=A0 dd73e2df77 modernize: reflecttypefor<br>
=C2=A0 =C2=A0 7f5bb1e99c modernize: testingcontext<br>
=C2=A0 =C2=A0 2875e48024 modernize: stringscut<br>
=C2=A0 =C2=A0 4c7d40cf77 modernize: mapsloop<br>
=C2=A0 =C2=A0 85ebca52fd modernize: minmax<br>
=C2=A0 =C2=A0 e8dc2fce32 modernize: rangeint<br>
=C2=A0 =C2=A0 e4f6019e62 vendor: <a href=3D"http://golang.org/x/net" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/net</a> v0.50.0<br>
=C2=A0 =C2=A0 464e14c68e vendor: <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> v0.40.0<br>
=C2=A0 =C2=A0 1e31c2825e vendor: <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> v0.34.0<br>
=C2=A0 =C2=A0 355f7bb602 vendor: <a href=3D"http://golang.org/x/sys" rel=3D=
"noreferrer" target=3D"_blank">golang.org/x/sys</a> v0.41.0<br>
=C2=A0 =C2=A0 a934c75de7 Dockerfile: update golangci-lint to v2.9.0<br>
=C2=A0 =C2=A0 ab06aebd4b internal/volumespec: fix prealloc linting<br>
=C2=A0 =C2=A0 9a0c78fdc0 cli-plugins/manager: fix prealloc linting<br>
=C2=A0 =C2=A0 2e544d6308 cli/command: fix prealloc linting<br>
=C2=A0 =C2=A0 12a0b0b7b9 cli/compose: fix prealloc linting<br>
=C2=A0 =C2=A0 99cef6f700 opts: fix prealloc linting<br>
=C2=A0 =C2=A0 8a8a3e1309 opts/swarmopts: fix prealloc linting<br>
=C2=A0 =C2=A0 9d2816c8a5 remove outdated &quot;nolint&quot; comments<br>
=C2=A0 =C2=A0 eaba9ecf18 cli/connhelper/ssh: remove outdated &quot;nolint&q=
uot; comment<br>
=C2=A0 =C2=A0 1f6b319d60 Dockerfile: update alpine to 3.23<br>
=C2=A0 =C2=A0 b598f8f0b8 docs: fix docker volume prune example<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">docker-moby_git.bb</a><br>
index 56d94675..ffd77fc0 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
@@ -44,8 +44,8 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
=C2=A0# so we get that tag, and make it our SRCREVS:<br>
=C2=A0#<br>
<br>
-SRCREV_moby =3D &quot;1da6517e1a4381297e56862f6f373f265c28d102&quot;<br>
-SRCREV_cli =3D &quot;df016a3a9538efb6d7d6e7c3baf291dbbe28eee0&quot;<br>
+SRCREV_moby =3D &quot;56be73107b381194c27938965bca74c4e2bb475b&quot;<br>
+SRCREV_cli =3D &quot;055a478ea9010a19d0d4674c0d0e87ade37a4223&quot;<br>
=C2=A0SRCREV_FORMAT =3D &quot;moby&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/moby/moby.gi=
t;nobranch=3D1;name=3Dmoby;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DEST=
SUFFIX%7D" rel=3D"noreferrer" target=3D"_blank">github.com/moby/moby.git;no=
branch=3D1;name=3Dmoby;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX=
}</a> \<br>
@@ -64,7 +64,7 @@ require docker.inc<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D4859e97a9c=
7780e77972d989f0823f28&quot;<br>
<br>
-DOCKER_VERSION =3D &quot;v29.3.0&quot;<br>
+DOCKER_VERSION =3D &quot;v29.4.3&quot;<br>
=C2=A0PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_moby}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;docker mobyproject:moby&quot;<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9799): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9799" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9799</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119419709/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119419709/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000dcc58f06524be7b9--


Return-Path: <paolo.barbolini@m4ss.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF449C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:52:29 +0000 (UTC)
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by mx.groups.io with SMTP id smtpd.web11.10789.1740664342605904555
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 05:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@m4ss.net header.s=MBO0001 header.b=fy6ArIAs;
 spf=pass (domain: m4ss.net, ip: 195.10.208.52, mailfrom: paolo.barbolini@m4ss.net)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4Z3Xp92cwcz9w5M;
	Thu, 27 Feb 2025 14:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4ss.net; s=MBO0001;
	t=1740664337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2OZSkYK7nD12Y3CPOTcOjMjVjH76vDJJ2mufJrP+m8E=;
	b=fy6ArIAsLTEkDSUO38ZKPoQwdpgXuCOSYrYxdxA/lHJE2aAny+rsU2/CFJygaoZTg97ZAZ
	loadP4a5iUyXC9JNzb70yf2tB8GieqRCybVDWmi6rmv01GO6szqU2hReDOxH4B0jhMwVRa
	XthojXqF2oGkShpCnXbjq/6H4u4xJm2k4zIUJAKl7iyUIOXejs8arOY8hkZ7qnOAtupvAY
	8BojNnXVneodUXkFFBTQTyJwrC64CyogTJ3FLcsHO0VlbHEF2nr21V8pf126R+nuB2Z542
	309eOcvPu90RdO6liZlAOd9omj8PRVyeL00UafdtZevilfFtI5yshJ42wTQwZA==
Content-Type: multipart/alternative;
 boundary="------------NAzkgbcZlULycJ0IMV6fmzA3"
Message-ID: <9489deee-ddc6-4903-8dd6-61245eeb771e@m4ss.net>
Date: Thu, 27 Feb 2025 14:52:15 +0100
MIME-Version: 1.0
Subject: Re: [meta-virtualization] [PATCH] docker: upgrade to v27.5.1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250227100913.309277-2-paolo.barbolini@m4ss.net>
 <CADkTA4PFJ5u28z_qk5itjyyzBMEY6+dSf=7E2BWsBj4DkMp7=g@mail.gmail.com>
From: Paolo Barbolini <paolo.barbolini@m4ss.net>
Content-Language: en-US
In-Reply-To: <CADkTA4PFJ5u28z_qk5itjyyzBMEY6+dSf=7E2BWsBj4DkMp7=g@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2025 13:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9151

This is a multi-part message in MIME format.
--------------NAzkgbcZlULycJ0IMV6fmzA3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Bruce,

Ok, no problem. I just wanted to make sure the latest version got in for=20
Walnascar.

Also, while sending this I noticed that the previous commits only=20
upgraded moby/moby,
while older commits upgraded both moby/moby and docker/cli at the same=20
time. I was
hoping to correct this as well.

Thanks,
Paolo

On 27/02/25 14:42, Bruce Ashfield wrote:
> Thanks for the patch, but I already have a flight of package=20
> upgrades=C2=A0incoming (I do them at the M1 and M3.5
> timeframes). I'll check my updates=C2=A0against=C2=A0this one, but ther=
e=20
> shouldn't be any differences (except mine will
> be slightly newer)
>
> Cheers,
>
> Bruce
>
> On Thu, Feb 27, 2025 at 5:10=E2=80=AFAM Paolo Barbolini via=20
> lists.yoctoproject.org <http://lists.yoctoproject.org>=20
> <paolo.barbolini=3Dm4ss.net@lists.yoctoproject.org> wrote:
>
>     Bumping moby to version v27.5.1, which comprises the following
>     commits:
>
>     =C2=A0 =C2=A0 0ec92ba6a4 Clear RWLayer reference under container lo=
ck
>     =C2=A0 =C2=A0 95122b4bde Dockerfile: update runc binary to v1.2.4
>     =C2=A0 =C2=A0 a78ae66d0e pkg/ioutils: deprecate BytesPipe, NewBytes=
Pipe,
>     ErrClosed
>     =C2=A0 =C2=A0 d9c2cde3be pkg/ioutils: deprecate WriteCounter, NewWr=
iteCounter
>     =C2=A0 =C2=A0 41697f61ec pkg/ioutils: deprecate NopFlusher
>     =C2=A0 =C2=A0 9b974d599a daemon: don't repeatedly call NumCPU if no=
t needed
>     =C2=A0 =C2=A0 5b7034f4c6 pkg/sysinfo: Deprecate NumCPU
>     =C2=A0 =C2=A0 f53d72e0be Fix unit tests for an nftables host
>     =C2=A0 =C2=A0 c83f658829 Dockerfile: update containerd to v1.7.25
>     =C2=A0 =C2=A0 cf37b661dd pkg/ioutils: deprecate NopWriter
>     =C2=A0 =C2=A0 8a2fd51c84 pkg/ioutils: deprecate NopWriteCloser
>     =C2=A0 =C2=A0 70a866e37e Dockerfile: update RootlessKit to v2.3.2
>     =C2=A0 =C2=A0 ad04c7b55a Allow users to ignore missing br_netfilter
>     =C2=A0 =C2=A0 d57309014d Move integration/network/bridge_test.go to=
 bridge
>     subdir
>     =C2=A0 =C2=A0 b33299da85 Bridge: on network delete, make sure it's =
deleted
>     from store
>     =C2=A0 =C2=A0 36706f0e5f ci: switch from jenkins to gha for arm64 b=
uild and
>     tests
>     =C2=A0 =C2=A0 6c832d05c4 gha: set arm64 GO_VERSION to 1.22.10
>     =C2=A0 =C2=A0 c83862c541 update to go1.22.11 (fix CVE-2024-45341,
>     CVE-2024-45336)
>     =C2=A0 =C2=A0 95d18194a4 gha: Adjust release branches
>     =C2=A0 =C2=A0 542e33c421 ci: update bake-action to v6
>     =C2=A0 =C2=A0 e85906c6a8 ci(bin-image): fix bake build
>     =C2=A0 =C2=A0 fbc854d9d3 Dockerfile: update docker CLI to v27.5.0
>     =C2=A0 =C2=A0 4c8ec29141 Dockerfile: update buildx to v0.20.0
>     =C2=A0 =C2=A0 0da7a2656e Dockerfile: update compose to v2.32.4
>
>     Bumping docker-cli to version v27.5.1, which comprises the
>     following commits:
>
>     =C2=A0 =C2=A0 e0b44d6d3f push: Don't default to DOCKER_DEFAULT_PLAT=
FORM
>     =C2=A0 =C2=A0 330a8e4e23 c8d: Remove `docker convert` mention
>     =C2=A0 =C2=A0 bd43ca786b push: Improve note message and colors
>     =C2=A0 =C2=A0 5777558c77 fix: container stream should not be termin=
ated by ctx
>     =C2=A0 =C2=A0 d36bdb0d84 test: e2e SIGTERM attached container on `d=
ocker run`
>     =C2=A0 =C2=A0 333103d93f chore: restore ctx without cancel on conta=
iner run
>     =C2=A0 =C2=A0 4d67ef09c8 fix: ctx cancellation on login prompt
>     =C2=A0 =C2=A0 5dea9d881c Enable completion for 'image' sub commands
>     =C2=A0 =C2=A0 338e7a604c Dockerfile.dev: install bash-completion in=
 dev
>     container
>     =C2=A0 =C2=A0 6cd1f6f26d Makefile: add completion target
>     =C2=A0 =C2=A0 d60252954b cli/command/container: NewRunCommand: slig=
ht
>     cleanup of completion
>     =C2=A0 =C2=A0 68fe829c96 cli/command/completion: add FileNames util=
ity
>     =C2=A0 =C2=A0 d914a3f97e cli/command/completion: add EnvVarNames ut=
ility
>     =C2=A0 =C2=A0 7a4062a4a9 cli/command/completion: add FromList utili=
ty
>     =C2=A0 =C2=A0 4473f48847 cli/command/container: provide flag-comple=
tion for
>     "docker create"
>     =C2=A0 =C2=A0 787caf2fe4 cmd/docker: fix completion for --context
>     =C2=A0 =C2=A0 3926ed6b24 cli/context/store: Names(): fix panic when=
 called
>     with nil-interface
>     =C2=A0 =C2=A0 36802176a7 cli/command/container: add completion for
>     --cap-add, --cap-drop
>     =C2=A0 =C2=A0 d11e73d6e6 cli/command/container: add completion for =
--restart
>     =C2=A0 =C2=A0 ab8a2c0716 cli/command/container: add completion for
>     --volumes-from
>     =C2=A0 =C2=A0 66ec7142ae cli/command/container: add completion for =
--stop-signal
>     =C2=A0 =C2=A0 dfe3c0c074 vendor: github.com/klauspost/compress
>     <http://github.com/klauspost/compress> v1.17.9
>     =C2=A0 =C2=A0 4f1a67e06b vendor: golang.org/x/sys <http://golang.or=
g/x/sys>
>     v0.21.0
>     =C2=A0 =C2=A0 a8e2130643 vendor: golang.org/x/text
>     <http://golang.org/x/text> v0.15.0
>     =C2=A0 =C2=A0 3577a17ce1 vendor: golang.org/x/crypto
>     <http://golang.org/x/crypto> v0.23.0
>     =C2=A0 =C2=A0 e7bcae9053 vendor: golang.org/x/net <http://golang.or=
g/x/net>
>     v0.25.0
>     =C2=A0 =C2=A0 76863b46b7 vendor: golang.org/x/sync
>     <http://golang.org/x/sync> v0.7.0
>     =C2=A0 =C2=A0 2794ebd599 vendor: github.com/containerd/containerd
>     <http://github.com/containerd/containerd> v1.7.19
>     =C2=A0 =C2=A0 674f8d2979 vendor: github.com/prometheus/procfs
>     <http://github.com/prometheus/procfs> v0.15.1
>     =C2=A0 =C2=A0 33e5c87957 vendor: google.golang.org/genproto/googlea=
pis/api
>     <http://google.golang.org/genproto/googleapis/api> 49dd2c1f3d0b
>     =C2=A0 =C2=A0 5ab44a4690 vendor: github.com/docker/cli-docs-tool
>     <http://github.com/docker/cli-docs-tool> v0.8.0
>     =C2=A0 =C2=A0 54c8eb7941 docs: fix typos and version for cli-docs-t=
ool scripts
>     =C2=A0 =C2=A0 c365c3cc8a Dockerfile: update buildx to v0.16.1
>     =C2=A0 =C2=A0 259d5e0f57 Dockerfile: update compose to v2.29.0
>     =C2=A0 =C2=A0 f7be714467 gha: check-pr-branch: verify major version=
 only
>     =C2=A0 =C2=A0 ad47d2a2c1 gha: update to macOS 13, add macOS 14 arm6=
4 (Apple
>     Silicon M1)
>     =C2=A0 =C2=A0 ca9636a1c3 test spring-cleaning
>     =C2=A0 =C2=A0 8992378c87 add support for DOCKER_CUSTOM_HEADERS env-=
var
>     (experimental)
>     =C2=A0 =C2=A0 c599566439 Allow for OomScoreAdj
>     =C2=A0 =C2=A0 b24c7417e4 vendor: github.com/containerd/containerd
>     <http://github.com/containerd/containerd> v1.7.20
>     =C2=A0 =C2=A0 b889b2562c vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.1.0
>     =C2=A0 =C2=A0 a74040315e vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.1.1
>     =C2=A0 =C2=A0 8a6f7d849d tests: fix flaxy `TestCloseRunningCommand`=
 test
>     =C2=A0 =C2=A0 7f02bc9704 tests: fix other flaky `connhelper` tests
>     =C2=A0 =C2=A0 dfb8f2155a attach: don't return context cancelled err=
or
>     =C2=A0 =C2=A0 1cf3637198 attach: wait for exit code from `Container=
Wait`
>     =C2=A0 =C2=A0 53cb00a818 update to go1.21.13
>     =C2=A0 =C2=A0 c7f3031f74 tests/run: fix flaky `RunAttachTermination=
` test
>     =C2=A0 =C2=A0 edd71d77c7 vendor: golang.org/x/sys <http://golang.or=
g/x/sys>
>     v0.22.0
>     =C2=A0 =C2=A0 40707e17b8 docs: refresh image versions in examples
>     =C2=A0 =C2=A0 54135b0724 gha: set permissions to read-only by defau=
lt
>     =C2=A0 =C2=A0 984ef9072c plugins: don't panic on Close if PluginSer=
ver nil
>     =C2=A0 =C2=A0 946d1097b8 run: fix GetList return empty issue for th=
rottledevice
>     =C2=A0 =C2=A0 bcd90be73a docs: fix link to http proxy document
>     =C2=A0 =C2=A0 73452e316f docs: update internal links after refactor
>     =C2=A0 =C2=A0 65dec14ac0 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> f9522e5e96c3 (v27.1.2-dev)
>     =C2=A0 =C2=A0 3eaf30278f docs: update link to moved build context d=
oc
>     =C2=A0 =C2=A0 0c29d6bac1 auth: add support for oauth device-code lo=
gin
>     =C2=A0 =C2=A0 b8a38fd22d Refactor `cli/command/registry`
>     =C2=A0 =C2=A0 afb5e143b1 login: normalize `registry-1.docker.io
>     <http://registry-1.docker.io>`
>     =C2=A0 =C2=A0 ad7912a846 fallback to regular login if oauth login f=
ails to start
>     =C2=A0 =C2=A0 83f6ca4a73 disable pseudoterminal creation
>     =C2=A0 =C2=A0 26536d1145 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.2.0-dev (9942d656bade)
>     =C2=A0 =C2=A0 99b647cfca image/list: Add `--tree` flag
>     =C2=A0 =C2=A0 ba43ae0bd2 cli/tree: Add `Content size` column
>     =C2=A0 =C2=A0 44a9ffa0ad list/tree: Align number right, text left
>     =C2=A0 =C2=A0 324cc5d30f list/tree: Sort by created date
>     =C2=A0 =C2=A0 ab55d75cf5 list/tree: Add an experimental warning
>     =C2=A0 =C2=A0 b719b10257 list/tree: Capitalize column headers
>     =C2=A0 =C2=A0 f42fa0b8e1 list/tree: Add spacing before the content =
and first
>     image
>     =C2=A0 =C2=A0 7196200fc2 list/tree: Fix some escape codes included =
in nonTTY
>     =C2=A0 =C2=A0 7902b52714 list/tree: Print <untagged> as dangling im=
age name
>     =C2=A0 =C2=A0 0c4e7478e2 list/tree: No extra spacing for graphdrive=
r
>     =C2=A0 =C2=A0 1b3fa65759 login: add oauth escape hatch
>     =C2=A0 =C2=A0 a58af379e1 login: add e2e tests for oauth + escape ha=
tch
>     =C2=A0 =C2=A0 2d7b8998c4 docs: use gh alert syntax for callouts
>     =C2=A0 =C2=A0 6ceb0aba82 cli/formatter: bracket IPv6 addrs prepende=
d to ports
>     =C2=A0 =C2=A0 24837f9260 chore: update link to docker engine api re=
ference
>     =C2=A0 =C2=A0 8e94ed15e6 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> b27de4ef1634 (v27.2.0-dev)
>     =C2=A0 =C2=A0 d8af7812b5 cli/command/system: remove redundant nil-c=
heck
>     (gosimple)
>     =C2=A0 =C2=A0 002cfcde85 cli/command: fix n-constant format string =
in call
>     (govet)
>     =C2=A0 =C2=A0 4b71d0d1af e2e/global: fix n-constant format string i=
n call
>     (govet)
>     =C2=A0 =C2=A0 64b9e4cd16 cli: rename args that collided with builti=
ns
>     (predeclard)
>     =C2=A0 =C2=A0 88a49df297 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> 3ab5c7d0036c (v27.2.0-dev)
>     =C2=A0 =C2=A0 32aadc9902 Revert "login: normalize `registry-1.docke=
r.io
>     <http://registry-1.docker.io>`"
>     =C2=A0 =C2=A0 83072c0232 login: use normalized hostname when storin=
g
>     =C2=A0 =C2=A0 8fcfc0b803 Dockerfile: update xx to v1.5.0
>     =C2=A0 =C2=A0 1a0b6a7a44 cli/connhelper: getConnectionHelper: move
>     ssh-option funcs out of closure
>     =C2=A0 =C2=A0 7a50cd0f01 docs: update docker login reference
>     =C2=A0 =C2=A0 6274754e66 copynit: s/WEB BASED/WEB-BASED/
>     =C2=A0 =C2=A0 de2b49b074 scripts/build/plugins: don't override CGO_=
ENABLED
>     set by .variables
>     =C2=A0 =C2=A0 1dfd11acc0 oauth/api: drain timer channel on each ite=
ration
>     =C2=A0 =C2=A0 5bf5cb9ff6 update to go1.22.6
>     =C2=A0 =C2=A0 d0c1a80617 login: handle non-tty scenario consistentl=
y
>     =C2=A0 =C2=A0 869df10064 vendor.mod: put github.com/pkg/browser
>     <http://github.com/pkg/browser> in the right group
>     =C2=A0 =C2=A0 41e61c45d9 [27.x] vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.2.0
>     =C2=A0 =C2=A0 3db9538748 update to go1.22.7
>     =C2=A0 =C2=A0 324cdbca40 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.2.1-dev (8b539b8df240)
>     =C2=A0 =C2=A0 b1e50eea92 docs: rename plugins index file and add li=
nkTitle
>     =C2=A0 =C2=A0 dbde5b3681 docs: add front matter title to deprecated=
.md
>     =C2=A0 =C2=A0 90559a6143 chore: fix style/lint issues in deprecated=
.md
>     =C2=A0 =C2=A0 4be6b1f3d7 info: stop printing "Expected" commits
>     =C2=A0 =C2=A0 c65ac2d90d volume/update: require 1 argument/fix pani=
c
>     =C2=A0 =C2=A0 965699ba0f cli/command/volume TestUpdateCmd: adjust f=
or older
>     error messages
>     =C2=A0 =C2=A0 05fbfc6995 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.2.1
>     =C2=A0 =C2=A0 1fe06dd0e7 vendor: github.com/moby/sys/signal
>     <http://github.com/moby/sys/signal> v0.7.1
>     =C2=A0 =C2=A0 7ff3daa446 vendor: github.com/moby/sys/symlink
>     <http://github.com/moby/sys/symlink> v0.3.0
>     =C2=A0 =C2=A0 4607c883c5 vendor: github.com/moby/sys/sequential
>     <http://github.com/moby/sys/sequential> v0.6.0
>     =C2=A0 =C2=A0 f68936ef2e vendor: dario.cat/mergo <http://dario.cat/=
mergo> v1.0.1
>     =C2=A0 =C2=A0 d64740d347 vendor: golang.org/x/sys <http://golang.or=
g/x/sys>
>     v0.24.0
>     =C2=A0 =C2=A0 5dde3d8570 vendor: golang.org/x/sync
>     <http://golang.org/x/sync> v0.8.0
>     =C2=A0 =C2=A0 090d1ff555 vendor: golang.org/x/time
>     <http://golang.org/x/time> v0.6.0
>     =C2=A0 =C2=A0 295b75e5ff vendor: golang.org/x/term
>     <http://golang.org/x/term> v0.23.0
>     =C2=A0 =C2=A0 49e33a03df vendor: golang.org/x/text
>     <http://golang.org/x/text> v0.17.0
>     =C2=A0 =C2=A0 fbb0cfd86a vendor: golang.org/x/crypto
>     <http://golang.org/x/crypto> v0.26.0
>     =C2=A0 =C2=A0 968341cc7d vendor: golang.org/x/net <http://golang.or=
g/x/net>
>     v0.28.0
>     =C2=A0 =C2=A0 1a199b63da vendor: tags.cncf.io/container-device-inte=
rface
>     <http://tags.cncf.io/container-device-interface> v0.8.0
>     =C2=A0 =C2=A0 2fc18b9874 vendor: google.golang.org/grpc
>     <http://google.golang.org/grpc> v1.62.0
>     =C2=A0 =C2=A0 74bebe2719 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> bf60e5cced83 (v27.3.0-dev)
>     =C2=A0 =C2=A0 b48720e65e command: check for wsl mount path on windo=
ws
>     =C2=A0 =C2=A0 7811c442d6 man: update dockerd man-page to include --=
feature flag
>     =C2=A0 =C2=A0 bc87ef962a man: fix duplicate word in --feature flag =
description
>     =C2=A0 =C2=A0 db7a014d37 man: dockerd: value is optional for --feat=
ure flag
>     =C2=A0 =C2=A0 245f79ff57 docs/reference: dockerd: add docs for --fe=
ature option
>     =C2=A0 =C2=A0 7c72283b37 man: dockerd: add description for --log-fo=
rmat option
>     =C2=A0 =C2=A0 84d4a5ef11 docs: dockerd: add documentation for --log=
-format
>     option
>     =C2=A0 =C2=A0 d896559894 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.3.0-rc.1
>     =C2=A0 =C2=A0 6fdd11b012 Dockerfile: update buildx to v0.17.1
>     =C2=A0 =C2=A0 b5c6541769 Dockerfile: update compose to v2.29.4
>     =C2=A0 =C2=A0 81ca58bd20 docs: Fix --rm=3Dfalse flag in container_r=
un.md
>     =C2=A0 =C2=A0 e2eb069aed gha: update codeql workflow to go1.22.7
>     =C2=A0 =C2=A0 4b5a196fee telemetry: pass otel errors to the otel ha=
ndler for
>     shutdown and force flush
>     =C2=A0 =C2=A0 c6dde25470 command: change drive to lowercase for wsl=
 path
>     =C2=A0 =C2=A0 ca62759b0f vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.3.0-rc2
>     =C2=A0 =C2=A0 460f1becc5 telemetry: fix early meterprovider shutdow=
n
>     =C2=A0 =C2=A0 854695884a vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.3.0
>     =C2=A0 =C2=A0 a4149b0c3d Dockerfile: update compose to v2.29.7
>     =C2=A0 =C2=A0 be9b9f3d70 Update `VERSION` file to `v27.3.1-dev`
>     =C2=A0 =C2=A0 23cea90233 docs: use important callout for buildkit v=
s legacy
>     builder
>     =C2=A0 =C2=A0 fbd51c01c6 docs: fix anchor link to web-based login s=
ection
>     =C2=A0 =C2=A0 6445ae2f02 docs/reference: stop, restart: add flag de=
scriptions
>     =C2=A0 =C2=A0 d2aec10148 docs: fix a typo in run.md
>     =C2=A0 =C2=A0 19279c9e53 opts: cleanup ParseEnvFile tests
>     =C2=A0 =C2=A0 6f5bfcb276 docs: fix inaccurate description of
>     --restart=3Dunless-stopped
>     =C2=A0 =C2=A0 132ecbce8b ci: update to go1.22.8
>     =C2=A0 =C2=A0 352ee0acd4 Images Tree: Change 'Used' to 'In Use'
>     =C2=A0 =C2=A0 4694fc8e45 Do not underline image name
>     =C2=A0 =C2=A0 25224ab615 opts: remove ErrBadKey as it's not used as=
 a
>     sentinel error
>     =C2=A0 =C2=A0 40539963c2 opts: parseKeyValueFile: cleanup and remov=
e
>     redundant trimming
>     =C2=A0 =C2=A0 9ab3d3a983 move parsing key-value files to a separate=
 package
>     =C2=A0 =C2=A0 3a1e08d6de vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.3.1
>     =C2=A0 =C2=A0 ed7d30ef89 vendor: golang.org/x/sys <http://golang.or=
g/x/sys>
>     v0.25.0
>     =C2=A0 =C2=A0 e93d817980 vendor: golang.org/x/text
>     <http://golang.org/x/text> v0.18.0
>     =C2=A0 =C2=A0 ae9b655aa8 vendor: golang.org/x/term
>     <http://golang.org/x/term> v0.24.0
>     =C2=A0 =C2=A0 949859a39e vendor: golang.org/x/crypto
>     <http://golang.org/x/crypto> v0.27.0
>     =C2=A0 =C2=A0 c93b0f1a0e vendor: golang.org/x/net <http://golang.or=
g/x/net>
>     v0.29.0
>     =C2=A0 =C2=A0 78be4c464f vendor: github.com/cespare/xxhash/v2
>     <http://github.com/cespare/xxhash/v2> v2.3.0
>     =C2=A0 =C2=A0 5cbb4ca191 vendor: google.golang.org/protobuf
>     <http://google.golang.org/protobuf> v1.34.1
>     =C2=A0 =C2=A0 2668b11ce4 vendor: google.golang.org/grpc
>     <http://google.golang.org/grpc> v1.66.2
>     =C2=A0 =C2=A0 52ac568385 cli/container: use github.com/moby/sys/cap=
ability
>     <http://github.com/moby/sys/capability> for completions
>     =C2=A0 =C2=A0 e6c6658563 cli/command/container: add unit tests for
>     completion helpers
>     =C2=A0 =C2=A0 64e98fa375 cli/command/completion: add Platforms
>     =C2=A0 =C2=A0 dd4b370d3c cli/command/container: add shell completio=
n for
>     --platform flags
>     =C2=A0 =C2=A0 099d4baeed cli/command/image: add shell completion fo=
r
>     --platform flags
>     =C2=A0 =C2=A0 b6e7eba447 completion: ContainerNames: don't panic on=
 nil filter
>     =C2=A0 =C2=A0 7d1fa132fb completion: add test for EnvVarNames
>     =C2=A0 =C2=A0 954dba4482 completion: add test for FileNames
>     =C2=A0 =C2=A0 62230c7ec2 completion: add test for FromList
>     =C2=A0 =C2=A0 02da13fb18 completion: add test for NoComplete
>     =C2=A0 =C2=A0 95e329d3e3 completion: add test for ContainerNames
>     =C2=A0 =C2=A0 77d002ae25 completion: add test for ImageNames
>     =C2=A0 =C2=A0 b68bf3afe4 completion: add test for NetworkNames
>     =C2=A0 =C2=A0 e2831282ee completion: add test for VolumeNames
>     =C2=A0 =C2=A0 b018e55ca4 Only complete removable containers if --fo=
rce is
>     not given
>     =C2=A0 =C2=A0 16201b3eb2 vendor: github.com/moby/swarmkit/v2
>     <http://github.com/moby/swarmkit/v2>
>     v2.0.0-20241017191044-e8ecf83ee08e
>     =C2=A0 =C2=A0 d3bf82db86 cli/command/plugins: use errors.Join inste=
ad of
>     custom cli.Errors
>     =C2=A0 =C2=A0 b3a55ecbba cli: deprecate Errors type
>     =C2=A0 =C2=A0 a8a8f68268 cli/command: ConfigureAuth: fix deprecatio=
n comment
>     =C2=A0 =C2=A0 dc36908ec5 Fix bash completion for `events --filter d=
aemon=3D`
>     =C2=A0 =C2=A0 254b966b0d cli/command/container: set empty args in t=
ests and
>     discard output
>     =C2=A0 =C2=A0 df7e6e5c5f cli/command/container: TestWaitExitOrRemov=
ed use
>     subtests
>     =C2=A0 =C2=A0 365e7a5a4e cli/config/credentials: skip saving config=
-file if
>     credentials didn't change
>     =C2=A0 =C2=A0 720da3c65a cil/config/credentials: remove newStore() =
test-utility
>     =C2=A0 =C2=A0 6736be779a cli/config/credentials: add test for save =
being
>     idempotent
>     =C2=A0 =C2=A0 470ab05503 Buffer 'docker stats' text to avoid termin=
al flickering
>     =C2=A0 =C2=A0 35c87e326c update to go1.22.9
>     =C2=A0 =C2=A0 e15a979e3d docs: change link to desktop docs
>     =C2=A0 =C2=A0 2521abdb1b vendor: golang.org/x/sys <http://golang.or=
g/x/sys>
>     v0.26.0
>     =C2=A0 =C2=A0 3f28d05292 vendor: google.golang.org/protobuf
>     <http://google.golang.org/protobuf> v1.35.1
>     =C2=A0 =C2=A0 46844b4f1d vendor: github.com/klauspost/compress
>     <http://github.com/klauspost/compress> v1.17.11
>     =C2=A0 =C2=A0 d23ab524c3 cli/command: PromptUserForCredentials: rem=
ove named
>     output variables
>     =C2=A0 =C2=A0 05455f8505 cli/command: PromptUserForCredentials: inl=
ine
>     isDefaultRegistry
>     =C2=A0 =C2=A0 97c25b7574 cli/command: PromptUserForCredentials: mov=
e "post"
>     check for empty name
>     =C2=A0 =C2=A0 78dbcca264 cli/command: PromptUserForCredentials: mov=
e
>     trimming where it's used
>     =C2=A0 =C2=A0 1377310110 cli/command: PromptUserForCredentials: alw=
ays trim
>     password
>     =C2=A0 =C2=A0 da3a1c3027 cli/command: PromptUserForCredentials: pri=
nt error
>     on terminal restore fail
>     =C2=A0 =C2=A0 ddeb7eb4ed cli/command: PromptUserForCredentials: use=
 consts
>     for all hints
>     =C2=A0 =C2=A0 168a4bdc05 cli/command: PromptUserForCredentials: sup=
press
>     unhandled errors
>     =C2=A0 =C2=A0 0dd07f0bfd docs: Link supported Go duration strings
>     =C2=A0 =C2=A0 9d5a2a6b66 docs: Correct `run` exit code 126 descript=
ion
>     =C2=A0 =C2=A0 2734299993 docs: update example redis tags from 3.0.x=
 to 7.4.x
>     =C2=A0 =C2=A0 7a906196ed golangci-lint: enable G204, add #nosec com=
ments instead
>     =C2=A0 =C2=A0 1890ea0762 golangci-lint: move gosec excludes to lint=
ers-settings
>     =C2=A0 =C2=A0 35122a0692 golangci-lint: update comment, and disable
>     "exclude-dirs-use-default"
>     =C2=A0 =C2=A0 df7113d7eb [27.x] cli: fix non-constant format string=
 in call
>     to errors.Errorf (govet)
>     =C2=A0 =C2=A0 8fe93724a3 bump golangci-lint to v1.61.0
>     =C2=A0 =C2=A0 0529d64f7f Dockerfile: update buildx to v0.18.0
>     =C2=A0 =C2=A0 9128f7b2d5 Dockerfile: update compose to v2.30.3
>     =C2=A0 =C2=A0 9e7d01bfb3 Add completion for `events --filter`
>     =C2=A0 =C2=A0 8caf347188 Add tests for completions that call the AP=
I
>     =C2=A0 =C2=A0 49b6551e97 [27.x] vendor: github.com/docker/docker
>     <http://github.com/docker/docker> 5765e9f35b00 (v27.4-dev)
>     =C2=A0 =C2=A0 38e37778b0 Share the container completions
>     =C2=A0 =C2=A0 f9ccc50304 Add completion for `--attach`
>     =C2=A0 =C2=A0 7e35be13ea Add completion for `--ipc`
>     =C2=A0 =C2=A0 6f439ea4a4 Add completion for `--link`
>     =C2=A0 =C2=A0 83f79c3e86 Add completion for `--pid`
>     =C2=A0 =C2=A0 6d087eb91b Add completion for `--storage-opt`
>     =C2=A0 =C2=A0 99e60c4e39 Add completion for `--ulimit`
>     =C2=A0 =C2=A0 e25548d1c6 Add completion for `--userns`
>     =C2=A0 =C2=A0 83303411ee Add completion for `--detach-keys`
>     =C2=A0 =C2=A0 25ff89519f Add completion for `--security-opt`
>     =C2=A0 =C2=A0 d11291966d Add completion for --log-driver` and --log=
-opt`
>     =C2=A0 =C2=A0 78544cd587 Add completion for `--uts`
>     =C2=A0 =C2=A0 e20bcf3565 Add completion for `--cgroupns`
>     =C2=A0 =C2=A0 ce77f4a545 Add completion for `--volume-driver`
>     =C2=A0 =C2=A0 955e003345 Handle null completions with a default cal=
lback
>     =C2=A0 =C2=A0 a4dc3d78e5 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.4.0-rc.1
>     =C2=A0 =C2=A0 3df40364f6 update go:build tags to use go1.22
>     =C2=A0 =C2=A0 cfe6090d5d cli/command/container: fix missing go:buil=
d tag
>     =C2=A0 =C2=A0 877668c92a [27.x] vendor: google.golang.org/grpc
>     <http://google.golang.org/grpc> v1.66.3
>     =C2=A0 =C2=A0 39d73afbdd Optimise `docker stats` to not require cle=
aring the
>     whole screen
>     =C2=A0 =C2=A0 6b9fb59d31 [27.x] vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.4.0-rc.2
>     =C2=A0 =C2=A0 47a4f70d8a update golangci-lint to v1.62.0
>     =C2=A0 =C2=A0 5476e9e1dc cli-plugins: Fix searching inaccessible di=
rectories
>     =C2=A0 =C2=A0 790d09e8dc cli-plugins: Simplify addPluginCandidatesF=
romDir
>     =C2=A0 =C2=A0 26da5bf025 fix: ctx should cancel image pull on run
>     =C2=A0 =C2=A0 530cf098de test: `run` does not have error status on =
27.x branch
>     =C2=A0 =C2=A0 f4fec76472 docs: fix janky rendering of toc on docs.d=
ocker.com
>     <http://docs.docker.com>
>     =C2=A0 =C2=A0 9348385006 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.4.0-rc.3
>     =C2=A0 =C2=A0 5a0508ccc8 cli/trust: GetNotaryRepository: remove use=
s of
>     RepositoryInfo.Class
>     =C2=A0 =C2=A0 3284a80b05 update to go1.22.10
>     =C2=A0 =C2=A0 dc8511cd60 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.4.0-rc.4
>     =C2=A0 =C2=A0 6377f54f27 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.4.0
>     =C2=A0 =C2=A0 f9783ec5c6 update xx to v1.6.1 for compatibility with=
 alpine 3.21
>     =C2=A0 =C2=A0 12d98b057f update go-md2man to v2.0.5
>     =C2=A0 =C2=A0 70815c1aa9 cli/command/system: remove netfilter warni=
ngs from
>     tests
>     =C2=A0 =C2=A0 d3b59fbd93 cli/command/container: use local copy of
>     pkg/system.IsAbs
>     =C2=A0 =C2=A0 a08a120bae cli/command/system: remove BridgeNfIptable=
s,
>     BridgeNfIp6tables in tests
>     =C2=A0 =C2=A0 d4dc4efef0 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.4.1
>     =C2=A0 =C2=A0 ef6bc69c04 vendor: github.com/Azure/go-ansiterm
>     <http://github.com/Azure/go-ansiterm>
>     v0.0.0-20230124172434-306776ec8161
>     =C2=A0 =C2=A0 bcec6cb71a vendor: github.com/cenkalti/backoff/v4
>     <http://github.com/cenkalti/backoff/v4> v4.3.0
>     =C2=A0 =C2=A0 e3d2562114 vendor: github.com/go-logr/logr
>     <http://github.com/go-logr/logr> v1.4.2
>     =C2=A0 =C2=A0 d8f2d1b155 vendor: update prometheus dependencies
>     =C2=A0 =C2=A0 2d3e97f32d vendor: github.com/grpc-ecosystem/grpc-gat=
eway/v2
>     <http://github.com/grpc-ecosystem/grpc-gateway/v2> v2.20.0
>     =C2=A0 =C2=A0 3e51dace7c [27.x] vendor: google.golang.org/genproto
>     <http://google.golang.org/genproto> f6361c86f094
>     =C2=A0 =C2=A0 f264af6124 vendor: go.opentelemetry.io/otel
>     <http://go.opentelemetry.io/otel> v1.28.0
>     =C2=A0 =C2=A0 fd818019f5 vendor:
>     go.opentelemetry.io/contrib/instrumentation/xxx
>     <http://go.opentelemetry.io/contrib/instrumentation/xxx> v0.53.0
>     =C2=A0 =C2=A0 f009ed2b34 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> c23af2910987 (27.x / v27.5.0-dev)
>     =C2=A0 =C2=A0 0e053a5cee vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.5.0-rc.1
>     =C2=A0 =C2=A0 8b340f4e5c TestRunCopyFromContainerToFilesystem: use =
Tar
>     without options
>     =C2=A0 =C2=A0 074820d7bb Fix cp test to separate source and destina=
tion
>     =C2=A0 =C2=A0 261d2241eb docs, man: remove confusing example for "-=
-isolation"
>     =C2=A0 =C2=A0 5d973da95b docs: dockerd: --oom-score-adj flag
>     =C2=A0 =C2=A0 f068c14063 contrib/completion: remove --oom-score-adj=
 daemon flag
>     =C2=A0 =C2=A0 0ced103038 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> 43fc912ef59a (v27.5.0-rc.2)
>     =C2=A0 =C2=A0 919350df54 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.5.0-rc.2
>     =C2=A0 =C2=A0 b277537cbe gha/build: Publish bin image for release b=
ranches
>     =C2=A0 =C2=A0 e32d69e31c vendor: github.com/docker/docker
>     <http://github.com/docker/docker> 38b84dce32c4 (v27.5.0)
>     =C2=A0 =C2=A0 397c2f87d5 vendor: github.com/docker/docker
>     <http://github.com/docker/docker> v27.5.0
>     =C2=A0 =C2=A0 1ccfae7946 update to go1.22.11 (fix CVE-2024-45341,
>     CVE-2024-45336)
>     =C2=A0 =C2=A0 fa1ba052d6 gha: Adjust release branches
>     =C2=A0 =C2=A0 777695f6d5 Dockerfile: update buildx to v0.20.0
>     =C2=A0 =C2=A0 fbc0a73b35 Dockerfile: update compose to v2.32.4
>
>     Signed-off-by: Paolo Barbolini <paolo.barbolini@m4ss.net>
>     ---
>     =C2=A0recipes-containers/docker/docker-moby_git.bb
>     <http://docker-moby_git.bb> | 6 +++---
>     =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/recipes-containers/docker/docker-moby_git.bb
>     <http://docker-moby_git.bb>
>     b/recipes-containers/docker/docker-moby_git.bb
>     <http://docker-moby_git.bb>
>     index 9f45f175..b3f5effe 100644
>     --- a/recipes-containers/docker/docker-moby_git.bb
>     <http://docker-moby_git.bb>
>     +++ b/recipes-containers/docker/docker-moby_git.bb
>     <http://docker-moby_git.bb>
>     @@ -44,8 +44,8 @@ DESCRIPTION =3D "Linux container runtime \
>     =C2=A0# so we get that tag, and make it our SRCREVS:
>     =C2=A0#
>
>     -SRCREV_moby =3D "43fc912ef59a83054ea7f6706df4d53a7dea4d80"
>     -SRCREV_cli =3D "d41cb083c352853f94b292a87df4859c4a96dcc2"
>     +SRCREV_moby =3D "4c9b3b011ae4c30145a7b344c870bdda01b454e2"
>     +SRCREV_cli =3D "9f9e4058019a37304dc6572ffcbb409d529b59d8"
>     =C2=A0SRCREV_FORMAT =3D "moby"
>     =C2=A0SRC_URI =3D "\
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     git://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3D=
https;destsuffix=3D${GO_SRCURI_DESTSUFFIX}
>     <http://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3D=
https;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
>     \
>     @@ -64,7 +64,7 @@ require docker.inc
>     =C2=A0LICENSE =3D "Apache-2.0"
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
>
>     -DOCKER_VERSION =3D "27.5.0-rc.2"
>     +DOCKER_VERSION =3D "27.5.1"
>     =C2=A0PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
>
>     =C2=A0CVE_PRODUCT =3D "docker mobyproject:moby"
>     --=20
>     2.48.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9149):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9149
>     Mute This Topic: https://lists.yoctoproject.org/mt/111412608/105081=
0
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     [bruce.ashfield@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------NAzkgbcZlULycJ0IMV6fmzA3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
    <link id=3D"MDHR_textcomplete" rel=3D"stylesheet"
href=3D"moz-extension://23dcd76a-441a-4202-b9e8-41cbf5a05ea1/vendor/textc=
omplete.css">
  </head>
  <body>
    <p>Hey Bruce,</p>
    <p>Ok, no problem. I just wanted to make sure the latest version got
      in for Walnascar.<br>
    </p>
    <p>Also, while sending this I noticed that the previous commits only
      upgraded moby/moby,<br>
      while older commits upgraded both moby/moby and docker/cli at the
      same time. I was<br>
      hoping to correct this as well.<br>
    </p>
    <p>Thanks,<br>
      Paolo<br>
    </p>
    <div class=3D"moz-cite-prefix">On 27/02/25 14:42, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4PFJ5u28z_qk5itjyyzBMEY6+dSf=3D7E2BWsBj4DkMp7=3Dg@mail.=
gmail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-size:small">Thanks for
          the patch, but I already have a flight of package
          upgrades=C2=A0incoming (I do them at the M1 and M3.5</div>
        <div class=3D"gmail_default" style=3D"font-size:small">timeframes=
).
          I'll check my updates=C2=A0against=C2=A0this one, but there sho=
uldn't be
          any differences (except mine will</div>
        <div class=3D"gmail_default" style=3D"font-size:small">be slightl=
y
          newer)</div>
        <div class=3D"gmail_default" style=3D"font-size:small"><br>
        </div>
        <div class=3D"gmail_default" style=3D"font-size:small">Cheers,</d=
iv>
        <div class=3D"gmail_default" style=3D"font-size:small"><br>
        </div>
        <div class=3D"gmail_default" style=3D"font-size:small">Bruce</div=
>
      </div>
      <br>
      <div class=3D"gmail_quote gmail_quote_container">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27, 2025 at
          5:10=E2=80=AFAM Paolo Barbolini via <a
            href=3D"http://lists.yoctoproject.org" moz-do-not-send=3D"tru=
e">lists.yoctoproject.org</a>
          &lt;paolo.barbolini=3D<a
            href=3D"mailto:m4ss.net@lists.yoctoproject.org"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">m4ss=
.net@lists.yoctoproject.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Bumping
          moby to version v27.5.1, which comprises the following
          commits:<br>
          <br>
          =C2=A0 =C2=A0 0ec92ba6a4 Clear RWLayer reference under containe=
r lock<br>
          =C2=A0 =C2=A0 95122b4bde Dockerfile: update runc binary to v1.2=
.4<br>
          =C2=A0 =C2=A0 a78ae66d0e pkg/ioutils: deprecate BytesPipe, NewB=
ytesPipe,
          ErrClosed<br>
          =C2=A0 =C2=A0 d9c2cde3be pkg/ioutils: deprecate WriteCounter,
          NewWriteCounter<br>
          =C2=A0 =C2=A0 41697f61ec pkg/ioutils: deprecate NopFlusher<br>
          =C2=A0 =C2=A0 9b974d599a daemon: don't repeatedly call NumCPU i=
f not
          needed<br>
          =C2=A0 =C2=A0 5b7034f4c6 pkg/sysinfo: Deprecate NumCPU<br>
          =C2=A0 =C2=A0 f53d72e0be Fix unit tests for an nftables host<br=
>
          =C2=A0 =C2=A0 c83f658829 Dockerfile: update containerd to v1.7.=
25<br>
          =C2=A0 =C2=A0 cf37b661dd pkg/ioutils: deprecate NopWriter<br>
          =C2=A0 =C2=A0 8a2fd51c84 pkg/ioutils: deprecate NopWriteCloser<=
br>
          =C2=A0 =C2=A0 70a866e37e Dockerfile: update RootlessKit to v2.3=
.2<br>
          =C2=A0 =C2=A0 ad04c7b55a Allow users to ignore missing br_netfi=
lter<br>
          =C2=A0 =C2=A0 d57309014d Move integration/network/bridge_test.g=
o to
          bridge subdir<br>
          =C2=A0 =C2=A0 b33299da85 Bridge: on network delete, make sure i=
t's
          deleted from store<br>
          =C2=A0 =C2=A0 36706f0e5f ci: switch from jenkins to gha for arm=
64 build
          and tests<br>
          =C2=A0 =C2=A0 6c832d05c4 gha: set arm64 GO_VERSION to 1.22.10<b=
r>
          =C2=A0 =C2=A0 c83862c541 update to go1.22.11 (fix CVE-2024-4534=
1,
          CVE-2024-45336)<br>
          =C2=A0 =C2=A0 95d18194a4 gha: Adjust release branches<br>
          =C2=A0 =C2=A0 542e33c421 ci: update bake-action to v6<br>
          =C2=A0 =C2=A0 e85906c6a8 ci(bin-image): fix bake build<br>
          =C2=A0 =C2=A0 fbc854d9d3 Dockerfile: update docker CLI to v27.5=
.0<br>
          =C2=A0 =C2=A0 4c8ec29141 Dockerfile: update buildx to v0.20.0<b=
r>
          =C2=A0 =C2=A0 0da7a2656e Dockerfile: update compose to v2.32.4<=
br>
          <br>
          Bumping docker-cli to version v27.5.1, which comprises the
          following commits:<br>
          <br>
          =C2=A0 =C2=A0 e0b44d6d3f push: Don't default to DOCKER_DEFAULT_=
PLATFORM<br>
          =C2=A0 =C2=A0 330a8e4e23 c8d: Remove `docker convert` mention<b=
r>
          =C2=A0 =C2=A0 bd43ca786b push: Improve note message and colors<=
br>
          =C2=A0 =C2=A0 5777558c77 fix: container stream should not be te=
rminated
          by ctx<br>
          =C2=A0 =C2=A0 d36bdb0d84 test: e2e SIGTERM attached container o=
n `docker
          run`<br>
          =C2=A0 =C2=A0 333103d93f chore: restore ctx without cancel on c=
ontainer
          run<br>
          =C2=A0 =C2=A0 4d67ef09c8 fix: ctx cancellation on login prompt<=
br>
          =C2=A0 =C2=A0 5dea9d881c Enable completion for 'image' sub comm=
ands<br>
          =C2=A0 =C2=A0 338e7a604c Dockerfile.dev: install bash-completio=
n in dev
          container<br>
          =C2=A0 =C2=A0 6cd1f6f26d Makefile: add completion target<br>
          =C2=A0 =C2=A0 d60252954b cli/command/container: NewRunCommand: =
slight
          cleanup of completion<br>
          =C2=A0 =C2=A0 68fe829c96 cli/command/completion: add FileNames =
utility<br>
          =C2=A0 =C2=A0 d914a3f97e cli/command/completion: add EnvVarName=
s utility<br>
          =C2=A0 =C2=A0 7a4062a4a9 cli/command/completion: add FromList u=
tility<br>
          =C2=A0 =C2=A0 4473f48847 cli/command/container: provide flag-co=
mpletion
          for "docker create"<br>
          =C2=A0 =C2=A0 787caf2fe4 cmd/docker: fix completion for --conte=
xt<br>
          =C2=A0 =C2=A0 3926ed6b24 cli/context/store: Names(): fix panic =
when
          called with nil-interface<br>
          =C2=A0 =C2=A0 36802176a7 cli/command/container: add completion =
for
          --cap-add, --cap-drop<br>
          =C2=A0 =C2=A0 d11e73d6e6 cli/command/container: add completion =
for
          --restart<br>
          =C2=A0 =C2=A0 ab8a2c0716 cli/command/container: add completion =
for
          --volumes-from<br>
          =C2=A0 =C2=A0 66ec7142ae cli/command/container: add completion =
for
          --stop-signal<br>
          =C2=A0 =C2=A0 dfe3c0c074 vendor: <a
            href=3D"http://github.com/klauspost/compress" rel=3D"noreferr=
er"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/klauspo=
st/compress</a>
          v1.17.9<br>
          =C2=A0 =C2=A0 4f1a67e06b vendor: <a href=3D"http://golang.org/x=
/sys"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/sys</a>
          v0.21.0<br>
          =C2=A0 =C2=A0 a8e2130643 vendor: <a href=3D"http://golang.org/x=
/text"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/text</a>
          v0.15.0<br>
          =C2=A0 =C2=A0 3577a17ce1 vendor: <a href=3D"http://golang.org/x=
/crypto"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/crypto</a>
          v0.23.0<br>
          =C2=A0 =C2=A0 e7bcae9053 vendor: <a href=3D"http://golang.org/x=
/net"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/net</a>
          v0.25.0<br>
          =C2=A0 =C2=A0 76863b46b7 vendor: <a href=3D"http://golang.org/x=
/sync"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/sync</a>
          v0.7.0<br>
          =C2=A0 =C2=A0 2794ebd599 vendor: <a
            href=3D"http://github.com/containerd/containerd"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/containerd/containerd</a>
          v1.7.19<br>
          =C2=A0 =C2=A0 674f8d2979 vendor: <a
            href=3D"http://github.com/prometheus/procfs" rel=3D"noreferre=
r"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/prometh=
eus/procfs</a>
          v0.15.1<br>
          =C2=A0 =C2=A0 33e5c87957 vendor: <a
            href=3D"http://google.golang.org/genproto/googleapis/api"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>google.golang.org/genproto/googleapis/api</a>
          49dd2c1f3d0b<br>
          =C2=A0 =C2=A0 5ab44a4690 vendor: <a
            href=3D"http://github.com/docker/cli-docs-tool"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/docker/cli-docs-tool</a>
          v0.8.0<br>
          =C2=A0 =C2=A0 54c8eb7941 docs: fix typos and version for cli-do=
cs-tool
          scripts<br>
          =C2=A0 =C2=A0 c365c3cc8a Dockerfile: update buildx to v0.16.1<b=
r>
          =C2=A0 =C2=A0 259d5e0f57 Dockerfile: update compose to v2.29.0<=
br>
          =C2=A0 =C2=A0 f7be714467 gha: check-pr-branch: verify major ver=
sion only<br>
          =C2=A0 =C2=A0 ad47d2a2c1 gha: update to macOS 13, add macOS 14 =
arm64
          (Apple Silicon M1)<br>
          =C2=A0 =C2=A0 ca9636a1c3 test spring-cleaning<br>
          =C2=A0 =C2=A0 8992378c87 add support for DOCKER_CUSTOM_HEADERS =
env-var
          (experimental)<br>
          =C2=A0 =C2=A0 c599566439 Allow for OomScoreAdj<br>
          =C2=A0 =C2=A0 b24c7417e4 vendor: <a
            href=3D"http://github.com/containerd/containerd"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/containerd/containerd</a>
          v1.7.20<br>
          =C2=A0 =C2=A0 b889b2562c vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.1.0<br>
          =C2=A0 =C2=A0 a74040315e vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.1.1<br>
          =C2=A0 =C2=A0 8a6f7d849d tests: fix flaxy `TestCloseRunningComm=
and` test<br>
          =C2=A0 =C2=A0 7f02bc9704 tests: fix other flaky `connhelper` te=
sts<br>
          =C2=A0 =C2=A0 dfb8f2155a attach: don't return context cancelled=
 error<br>
          =C2=A0 =C2=A0 1cf3637198 attach: wait for exit code from `Conta=
inerWait`<br>
          =C2=A0 =C2=A0 53cb00a818 update to go1.21.13<br>
          =C2=A0 =C2=A0 c7f3031f74 tests/run: fix flaky `RunAttachTermina=
tion`
          test<br>
          =C2=A0 =C2=A0 edd71d77c7 vendor: <a href=3D"http://golang.org/x=
/sys"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/sys</a>
          v0.22.0<br>
          =C2=A0 =C2=A0 40707e17b8 docs: refresh image versions in exampl=
es<br>
          =C2=A0 =C2=A0 54135b0724 gha: set permissions to read-only by d=
efault<br>
          =C2=A0 =C2=A0 984ef9072c plugins: don't panic on Close if Plugi=
nServer
          nil<br>
          =C2=A0 =C2=A0 946d1097b8 run: fix GetList return empty issue fo=
r
          throttledevice<br>
          =C2=A0 =C2=A0 bcd90be73a docs: fix link to http proxy document<=
br>
          =C2=A0 =C2=A0 73452e316f docs: update internal links after refa=
ctor<br>
          =C2=A0 =C2=A0 65dec14ac0 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          f9522e5e96c3 (v27.1.2-dev)<br>
          =C2=A0 =C2=A0 3eaf30278f docs: update link to moved build conte=
xt doc<br>
          =C2=A0 =C2=A0 0c29d6bac1 auth: add support for oauth device-cod=
e login<br>
          =C2=A0 =C2=A0 b8a38fd22d Refactor `cli/command/registry`<br>
          =C2=A0 =C2=A0 afb5e143b1 login: normalize `<a
            href=3D"http://registry-1.docker.io" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">registry-1.docker.=
io</a>`<br>
          =C2=A0 =C2=A0 ad7912a846 fallback to regular login if oauth log=
in fails
          to start<br>
          =C2=A0 =C2=A0 83f6ca4a73 disable pseudoterminal creation<br>
          =C2=A0 =C2=A0 26536d1145 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.2.0-dev (9942d656bade)<br>
          =C2=A0 =C2=A0 99b647cfca image/list: Add `--tree` flag<br>
          =C2=A0 =C2=A0 ba43ae0bd2 cli/tree: Add `Content size` column<br=
>
          =C2=A0 =C2=A0 44a9ffa0ad list/tree: Align number right, text le=
ft<br>
          =C2=A0 =C2=A0 324cc5d30f list/tree: Sort by created date<br>
          =C2=A0 =C2=A0 ab55d75cf5 list/tree: Add an experimental warning=
<br>
          =C2=A0 =C2=A0 b719b10257 list/tree: Capitalize column headers<b=
r>
          =C2=A0 =C2=A0 f42fa0b8e1 list/tree: Add spacing before the cont=
ent and
          first image<br>
          =C2=A0 =C2=A0 7196200fc2 list/tree: Fix some escape codes inclu=
ded in
          nonTTY<br>
          =C2=A0 =C2=A0 7902b52714 list/tree: Print &lt;untagged&gt; as d=
angling
          image name<br>
          =C2=A0 =C2=A0 0c4e7478e2 list/tree: No extra spacing for graphd=
river<br>
          =C2=A0 =C2=A0 1b3fa65759 login: add oauth escape hatch<br>
          =C2=A0 =C2=A0 a58af379e1 login: add e2e tests for oauth + escap=
e hatch<br>
          =C2=A0 =C2=A0 2d7b8998c4 docs: use gh alert syntax for callouts=
<br>
          =C2=A0 =C2=A0 6ceb0aba82 cli/formatter: bracket IPv6 addrs prep=
ended to
          ports<br>
          =C2=A0 =C2=A0 24837f9260 chore: update link to docker engine ap=
i
          reference<br>
          =C2=A0 =C2=A0 8e94ed15e6 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          b27de4ef1634 (v27.2.0-dev)<br>
          =C2=A0 =C2=A0 d8af7812b5 cli/command/system: remove redundant n=
il-check
          (gosimple)<br>
          =C2=A0 =C2=A0 002cfcde85 cli/command: fix n-constant format str=
ing in
          call (govet)<br>
          =C2=A0 =C2=A0 4b71d0d1af e2e/global: fix n-constant format stri=
ng in
          call (govet)<br>
          =C2=A0 =C2=A0 64b9e4cd16 cli: rename args that collided with bu=
iltins
          (predeclard)<br>
          =C2=A0 =C2=A0 88a49df297 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          3ab5c7d0036c (v27.2.0-dev)<br>
          =C2=A0 =C2=A0 32aadc9902 Revert "login: normalize `<a
            href=3D"http://registry-1.docker.io" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">registry-1.docker.=
io</a>`"<br>
          =C2=A0 =C2=A0 83072c0232 login: use normalized hostname when st=
oring<br>
          =C2=A0 =C2=A0 8fcfc0b803 Dockerfile: update xx to v1.5.0<br>
          =C2=A0 =C2=A0 1a0b6a7a44 cli/connhelper: getConnectionHelper: m=
ove
          ssh-option funcs out of closure<br>
          =C2=A0 =C2=A0 7a50cd0f01 docs: update docker login reference<br=
>
          =C2=A0 =C2=A0 6274754e66 copynit: s/WEB BASED/WEB-BASED/<br>
          =C2=A0 =C2=A0 de2b49b074 scripts/build/plugins: don't override
          CGO_ENABLED set by .variables<br>
          =C2=A0 =C2=A0 1dfd11acc0 oauth/api: drain timer channel on each
          iteration<br>
          =C2=A0 =C2=A0 5bf5cb9ff6 update to go1.22.6<br>
          =C2=A0 =C2=A0 d0c1a80617 login: handle non-tty scenario consist=
ently<br>
          =C2=A0 =C2=A0 869df10064 vendor.mod: put <a
            href=3D"http://github.com/pkg/browser" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/pkg/bro=
wser</a>
          in the right group<br>
          =C2=A0 =C2=A0 41e61c45d9 [27.x] vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.2.0<br>
          =C2=A0 =C2=A0 3db9538748 update to go1.22.7<br>
          =C2=A0 =C2=A0 324cdbca40 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.2.1-dev (8b539b8df240)<br>
          =C2=A0 =C2=A0 b1e50eea92 docs: rename plugins index file and ad=
d
          linkTitle<br>
          =C2=A0 =C2=A0 dbde5b3681 docs: add front matter title to deprec=
ated.md<br>
          =C2=A0 =C2=A0 90559a6143 chore: fix style/lint issues in deprec=
ated.md<br>
          =C2=A0 =C2=A0 4be6b1f3d7 info: stop printing "Expected" commits=
<br>
          =C2=A0 =C2=A0 c65ac2d90d volume/update: require 1 argument/fix =
panic<br>
          =C2=A0 =C2=A0 965699ba0f cli/command/volume TestUpdateCmd: adju=
st for
          older error messages<br>
          =C2=A0 =C2=A0 05fbfc6995 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.2.1<br>
          =C2=A0 =C2=A0 1fe06dd0e7 vendor: <a
            href=3D"http://github.com/moby/sys/signal" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/moby/sy=
s/signal</a>
          v0.7.1<br>
          =C2=A0 =C2=A0 7ff3daa446 vendor: <a
            href=3D"http://github.com/moby/sys/symlink" rel=3D"noreferrer=
"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/moby/sy=
s/symlink</a>
          v0.3.0<br>
          =C2=A0 =C2=A0 4607c883c5 vendor: <a
            href=3D"http://github.com/moby/sys/sequential"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/moby/sys/sequential</a>
          v0.6.0<br>
          =C2=A0 =C2=A0 f68936ef2e vendor: <a href=3D"http://dario.cat/me=
rgo"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>dario.cat/mergo</a>
          v1.0.1<br>
          =C2=A0 =C2=A0 d64740d347 vendor: <a href=3D"http://golang.org/x=
/sys"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/sys</a>
          v0.24.0<br>
          =C2=A0 =C2=A0 5dde3d8570 vendor: <a href=3D"http://golang.org/x=
/sync"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/sync</a>
          v0.8.0<br>
          =C2=A0 =C2=A0 090d1ff555 vendor: <a href=3D"http://golang.org/x=
/time"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/time</a>
          v0.6.0<br>
          =C2=A0 =C2=A0 295b75e5ff vendor: <a href=3D"http://golang.org/x=
/term"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/term</a>
          v0.23.0<br>
          =C2=A0 =C2=A0 49e33a03df vendor: <a href=3D"http://golang.org/x=
/text"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/text</a>
          v0.17.0<br>
          =C2=A0 =C2=A0 fbb0cfd86a vendor: <a href=3D"http://golang.org/x=
/crypto"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/crypto</a>
          v0.26.0<br>
          =C2=A0 =C2=A0 968341cc7d vendor: <a href=3D"http://golang.org/x=
/net"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/net</a>
          v0.28.0<br>
          =C2=A0 =C2=A0 1a199b63da vendor: <a
            href=3D"http://tags.cncf.io/container-device-interface"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>tags.cncf.io/container-device-interface</a>
          v0.8.0<br>
          =C2=A0 =C2=A0 2fc18b9874 vendor: <a
            href=3D"http://google.golang.org/grpc" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">google.golang.org/=
grpc</a>
          v1.62.0<br>
          =C2=A0 =C2=A0 74bebe2719 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          bf60e5cced83 (v27.3.0-dev)<br>
          =C2=A0 =C2=A0 b48720e65e command: check for wsl mount path on w=
indows<br>
          =C2=A0 =C2=A0 7811c442d6 man: update dockerd man-page to includ=
e
          --feature flag<br>
          =C2=A0 =C2=A0 bc87ef962a man: fix duplicate word in --feature f=
lag
          description<br>
          =C2=A0 =C2=A0 db7a014d37 man: dockerd: value is optional for --=
feature
          flag<br>
          =C2=A0 =C2=A0 245f79ff57 docs/reference: dockerd: add docs for =
--feature
          option<br>
          =C2=A0 =C2=A0 7c72283b37 man: dockerd: add description for --lo=
g-format
          option<br>
          =C2=A0 =C2=A0 84d4a5ef11 docs: dockerd: add documentation for
          --log-format option<br>
          =C2=A0 =C2=A0 d896559894 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.3.0-rc.1<br>
          =C2=A0 =C2=A0 6fdd11b012 Dockerfile: update buildx to v0.17.1<b=
r>
          =C2=A0 =C2=A0 b5c6541769 Dockerfile: update compose to v2.29.4<=
br>
          =C2=A0 =C2=A0 81ca58bd20 docs: Fix --rm=3Dfalse flag in contain=
er_run.md<br>
          =C2=A0 =C2=A0 e2eb069aed gha: update codeql workflow to go1.22.=
7<br>
          =C2=A0 =C2=A0 4b5a196fee telemetry: pass otel errors to the ote=
l handler
          for shutdown and force flush<br>
          =C2=A0 =C2=A0 c6dde25470 command: change drive to lowercase for=
 wsl path<br>
          =C2=A0 =C2=A0 ca62759b0f vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.3.0-rc2<br>
          =C2=A0 =C2=A0 460f1becc5 telemetry: fix early meterprovider shu=
tdown<br>
          =C2=A0 =C2=A0 854695884a vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.3.0<br>
          =C2=A0 =C2=A0 a4149b0c3d Dockerfile: update compose to v2.29.7<=
br>
          =C2=A0 =C2=A0 be9b9f3d70 Update `VERSION` file to `v27.3.1-dev`=
<br>
          =C2=A0 =C2=A0 23cea90233 docs: use important callout for buildk=
it vs
          legacy builder<br>
          =C2=A0 =C2=A0 fbd51c01c6 docs: fix anchor link to web-based log=
in
          section<br>
          =C2=A0 =C2=A0 6445ae2f02 docs/reference: stop, restart: add fla=
g
          descriptions<br>
          =C2=A0 =C2=A0 d2aec10148 docs: fix a typo in run.md<br>
          =C2=A0 =C2=A0 19279c9e53 opts: cleanup ParseEnvFile tests<br>
          =C2=A0 =C2=A0 6f5bfcb276 docs: fix inaccurate description of
          --restart=3Dunless-stopped<br>
          =C2=A0 =C2=A0 132ecbce8b ci: update to go1.22.8<br>
          =C2=A0 =C2=A0 352ee0acd4 Images Tree: Change 'Used' to 'In Use'=
<br>
          =C2=A0 =C2=A0 4694fc8e45 Do not underline image name<br>
          =C2=A0 =C2=A0 25224ab615 opts: remove ErrBadKey as it's not use=
d as a
          sentinel error<br>
          =C2=A0 =C2=A0 40539963c2 opts: parseKeyValueFile: cleanup and r=
emove
          redundant trimming<br>
          =C2=A0 =C2=A0 9ab3d3a983 move parsing key-value files to a sepa=
rate
          package<br>
          =C2=A0 =C2=A0 3a1e08d6de vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.3.1<br>
          =C2=A0 =C2=A0 ed7d30ef89 vendor: <a href=3D"http://golang.org/x=
/sys"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/sys</a>
          v0.25.0<br>
          =C2=A0 =C2=A0 e93d817980 vendor: <a href=3D"http://golang.org/x=
/text"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/text</a>
          v0.18.0<br>
          =C2=A0 =C2=A0 ae9b655aa8 vendor: <a href=3D"http://golang.org/x=
/term"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/term</a>
          v0.24.0<br>
          =C2=A0 =C2=A0 949859a39e vendor: <a href=3D"http://golang.org/x=
/crypto"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/crypto</a>
          v0.27.0<br>
          =C2=A0 =C2=A0 c93b0f1a0e vendor: <a href=3D"http://golang.org/x=
/net"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/net</a>
          v0.29.0<br>
          =C2=A0 =C2=A0 78be4c464f vendor: <a
            href=3D"http://github.com/cespare/xxhash/v2" rel=3D"noreferre=
r"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/cespare=
/xxhash/v2</a>
          v2.3.0<br>
          =C2=A0 =C2=A0 5cbb4ca191 vendor: <a
            href=3D"http://google.golang.org/protobuf" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">google.golang.org/=
protobuf</a>
          v1.34.1<br>
          =C2=A0 =C2=A0 2668b11ce4 vendor: <a
            href=3D"http://google.golang.org/grpc" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">google.golang.org/=
grpc</a>
          v1.66.2<br>
          =C2=A0 =C2=A0 52ac568385 cli/container: use <a
            href=3D"http://github.com/moby/sys/capability"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/moby/sys/capability</a>
          for completions<br>
          =C2=A0 =C2=A0 e6c6658563 cli/command/container: add unit tests =
for
          completion helpers<br>
          =C2=A0 =C2=A0 64e98fa375 cli/command/completion: add Platforms<=
br>
          =C2=A0 =C2=A0 dd4b370d3c cli/command/container: add shell compl=
etion for
          --platform flags<br>
          =C2=A0 =C2=A0 099d4baeed cli/command/image: add shell completio=
n for
          --platform flags<br>
          =C2=A0 =C2=A0 b6e7eba447 completion: ContainerNames: don't pani=
c on nil
          filter<br>
          =C2=A0 =C2=A0 7d1fa132fb completion: add test for EnvVarNames<b=
r>
          =C2=A0 =C2=A0 954dba4482 completion: add test for FileNames<br>
          =C2=A0 =C2=A0 62230c7ec2 completion: add test for FromList<br>
          =C2=A0 =C2=A0 02da13fb18 completion: add test for NoComplete<br=
>
          =C2=A0 =C2=A0 95e329d3e3 completion: add test for ContainerName=
s<br>
          =C2=A0 =C2=A0 77d002ae25 completion: add test for ImageNames<br=
>
          =C2=A0 =C2=A0 b68bf3afe4 completion: add test for NetworkNames<=
br>
          =C2=A0 =C2=A0 e2831282ee completion: add test for VolumeNames<b=
r>
          =C2=A0 =C2=A0 b018e55ca4 Only complete removable containers if =
--force
          is not given<br>
          =C2=A0 =C2=A0 16201b3eb2 vendor: <a
            href=3D"http://github.com/moby/swarmkit/v2" rel=3D"noreferrer=
"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/moby/sw=
armkit/v2</a>
          v2.0.0-20241017191044-e8ecf83ee08e<br>
          =C2=A0 =C2=A0 d3bf82db86 cli/command/plugins: use errors.Join i=
nstead of
          custom cli.Errors<br>
          =C2=A0 =C2=A0 b3a55ecbba cli: deprecate Errors type<br>
          =C2=A0 =C2=A0 a8a8f68268 cli/command: ConfigureAuth: fix deprec=
ation
          comment<br>
          =C2=A0 =C2=A0 dc36908ec5 Fix bash completion for `events --filt=
er
          daemon=3D`<br>
          =C2=A0 =C2=A0 254b966b0d cli/command/container: set empty args =
in tests
          and discard output<br>
          =C2=A0 =C2=A0 df7e6e5c5f cli/command/container: TestWaitExitOrR=
emoved
          use subtests<br>
          =C2=A0 =C2=A0 365e7a5a4e cli/config/credentials: skip saving co=
nfig-file
          if credentials didn't change<br>
          =C2=A0 =C2=A0 720da3c65a cil/config/credentials: remove newStor=
e()
          test-utility<br>
          =C2=A0 =C2=A0 6736be779a cli/config/credentials: add test for s=
ave being
          idempotent<br>
          =C2=A0 =C2=A0 470ab05503 Buffer 'docker stats' text to avoid te=
rminal
          flickering<br>
          =C2=A0 =C2=A0 35c87e326c update to go1.22.9<br>
          =C2=A0 =C2=A0 e15a979e3d docs: change link to desktop docs<br>
          =C2=A0 =C2=A0 2521abdb1b vendor: <a href=3D"http://golang.org/x=
/sys"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>golang.org/x/sys</a>
          v0.26.0<br>
          =C2=A0 =C2=A0 3f28d05292 vendor: <a
            href=3D"http://google.golang.org/protobuf" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">google.golang.org/=
protobuf</a>
          v1.35.1<br>
          =C2=A0 =C2=A0 46844b4f1d vendor: <a
            href=3D"http://github.com/klauspost/compress" rel=3D"noreferr=
er"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/klauspo=
st/compress</a>
          v1.17.11<br>
          =C2=A0 =C2=A0 d23ab524c3 cli/command: PromptUserForCredentials:=
 remove
          named output variables<br>
          =C2=A0 =C2=A0 05455f8505 cli/command: PromptUserForCredentials:=
 inline
          isDefaultRegistry<br>
          =C2=A0 =C2=A0 97c25b7574 cli/command: PromptUserForCredentials:=
 move
          "post" check for empty name<br>
          =C2=A0 =C2=A0 78dbcca264 cli/command: PromptUserForCredentials:=
 move
          trimming where it's used<br>
          =C2=A0 =C2=A0 1377310110 cli/command: PromptUserForCredentials:=
 always
          trim password<br>
          =C2=A0 =C2=A0 da3a1c3027 cli/command: PromptUserForCredentials:=
 print
          error on terminal restore fail<br>
          =C2=A0 =C2=A0 ddeb7eb4ed cli/command: PromptUserForCredentials:=
 use
          consts for all hints<br>
          =C2=A0 =C2=A0 168a4bdc05 cli/command: PromptUserForCredentials:=
 suppress
          unhandled errors<br>
          =C2=A0 =C2=A0 0dd07f0bfd docs: Link supported Go duration strin=
gs<br>
          =C2=A0 =C2=A0 9d5a2a6b66 docs: Correct `run` exit code 126 desc=
ription<br>
          =C2=A0 =C2=A0 2734299993 docs: update example redis tags from 3=
.0.x to
          7.4.x<br>
          =C2=A0 =C2=A0 7a906196ed golangci-lint: enable G204, add #nosec=
 comments
          instead<br>
          =C2=A0 =C2=A0 1890ea0762 golangci-lint: move gosec excludes to
          linters-settings<br>
          =C2=A0 =C2=A0 35122a0692 golangci-lint: update comment, and dis=
able
          "exclude-dirs-use-default"<br>
          =C2=A0 =C2=A0 df7113d7eb [27.x] cli: fix non-constant format st=
ring in
          call to errors.Errorf (govet)<br>
          =C2=A0 =C2=A0 8fe93724a3 bump golangci-lint to v1.61.0<br>
          =C2=A0 =C2=A0 0529d64f7f Dockerfile: update buildx to v0.18.0<b=
r>
          =C2=A0 =C2=A0 9128f7b2d5 Dockerfile: update compose to v2.30.3<=
br>
          =C2=A0 =C2=A0 9e7d01bfb3 Add completion for `events --filter`<b=
r>
          =C2=A0 =C2=A0 8caf347188 Add tests for completions that call th=
e API<br>
          =C2=A0 =C2=A0 49b6551e97 [27.x] vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          5765e9f35b00 (v27.4-dev)<br>
          =C2=A0 =C2=A0 38e37778b0 Share the container completions<br>
          =C2=A0 =C2=A0 f9ccc50304 Add completion for `--attach`<br>
          =C2=A0 =C2=A0 7e35be13ea Add completion for `--ipc`<br>
          =C2=A0 =C2=A0 6f439ea4a4 Add completion for `--link`<br>
          =C2=A0 =C2=A0 83f79c3e86 Add completion for `--pid`<br>
          =C2=A0 =C2=A0 6d087eb91b Add completion for `--storage-opt`<br>
          =C2=A0 =C2=A0 99e60c4e39 Add completion for `--ulimit`<br>
          =C2=A0 =C2=A0 e25548d1c6 Add completion for `--userns`<br>
          =C2=A0 =C2=A0 83303411ee Add completion for `--detach-keys`<br>
          =C2=A0 =C2=A0 25ff89519f Add completion for `--security-opt`<br=
>
          =C2=A0 =C2=A0 d11291966d Add completion for --log-driver` and -=
-log-opt`<br>
          =C2=A0 =C2=A0 78544cd587 Add completion for `--uts`<br>
          =C2=A0 =C2=A0 e20bcf3565 Add completion for `--cgroupns`<br>
          =C2=A0 =C2=A0 ce77f4a545 Add completion for `--volume-driver`<b=
r>
          =C2=A0 =C2=A0 955e003345 Handle null completions with a default=
 callback<br>
          =C2=A0 =C2=A0 a4dc3d78e5 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.4.0-rc.1<br>
          =C2=A0 =C2=A0 3df40364f6 update go:build tags to use go1.22<br>
          =C2=A0 =C2=A0 cfe6090d5d cli/command/container: fix missing go:=
build tag<br>
          =C2=A0 =C2=A0 877668c92a [27.x] vendor: <a
            href=3D"http://google.golang.org/grpc" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">google.golang.org/=
grpc</a>
          v1.66.3<br>
          =C2=A0 =C2=A0 39d73afbdd Optimise `docker stats` to not require=
 clearing
          the whole screen<br>
          =C2=A0 =C2=A0 6b9fb59d31 [27.x] vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.4.0-rc.2<br>
          =C2=A0 =C2=A0 47a4f70d8a update golangci-lint to v1.62.0<br>
          =C2=A0 =C2=A0 5476e9e1dc cli-plugins: Fix searching inaccessibl=
e
          directories<br>
          =C2=A0 =C2=A0 790d09e8dc cli-plugins: Simplify
          addPluginCandidatesFromDir<br>
          =C2=A0 =C2=A0 26da5bf025 fix: ctx should cancel image pull on r=
un<br>
          =C2=A0 =C2=A0 530cf098de test: `run` does not have error status=
 on 27.x
          branch<br>
          =C2=A0 =C2=A0 f4fec76472 docs: fix janky rendering of toc on <a
            href=3D"http://docs.docker.com" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">docs.docker.com</a=
><br>
          =C2=A0 =C2=A0 9348385006 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.4.0-rc.3<br>
          =C2=A0 =C2=A0 5a0508ccc8 cli/trust: GetNotaryRepository: remove=
 uses of
          RepositoryInfo.Class<br>
          =C2=A0 =C2=A0 3284a80b05 update to go1.22.10<br>
          =C2=A0 =C2=A0 dc8511cd60 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.4.0-rc.4<br>
          =C2=A0 =C2=A0 6377f54f27 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.4.0<br>
          =C2=A0 =C2=A0 f9783ec5c6 update xx to v1.6.1 for compatibility =
with
          alpine 3.21<br>
          =C2=A0 =C2=A0 12d98b057f update go-md2man to v2.0.5<br>
          =C2=A0 =C2=A0 70815c1aa9 cli/command/system: remove netfilter w=
arnings
          from tests<br>
          =C2=A0 =C2=A0 d3b59fbd93 cli/command/container: use local copy =
of
          pkg/system.IsAbs<br>
          =C2=A0 =C2=A0 a08a120bae cli/command/system: remove BridgeNfIpt=
ables,
          BridgeNfIp6tables in tests<br>
          =C2=A0 =C2=A0 d4dc4efef0 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.4.1<br>
          =C2=A0 =C2=A0 ef6bc69c04 vendor: <a
            href=3D"http://github.com/Azure/go-ansiterm" rel=3D"noreferre=
r"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/Azure/g=
o-ansiterm</a>
          v0.0.0-20230124172434-306776ec8161<br>
          =C2=A0 =C2=A0 bcec6cb71a vendor: <a
            href=3D"http://github.com/cenkalti/backoff/v4"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/cenkalti/backoff/v4</a>
          v4.3.0<br>
          =C2=A0 =C2=A0 e3d2562114 vendor: <a
            href=3D"http://github.com/go-logr/logr" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/go-logr=
/logr</a>
          v1.4.2<br>
          =C2=A0 =C2=A0 d8f2d1b155 vendor: update prometheus dependencies=
<br>
          =C2=A0 =C2=A0 2d3e97f32d vendor: <a
            href=3D"http://github.com/grpc-ecosystem/grpc-gateway/v2"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/grpc-ecosystem/grpc-gateway/v2</a>
          v2.20.0<br>
          =C2=A0 =C2=A0 3e51dace7c [27.x] vendor: <a
            href=3D"http://google.golang.org/genproto" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">google.golang.org/=
genproto</a>
          f6361c86f094<br>
          =C2=A0 =C2=A0 f264af6124 vendor: <a
            href=3D"http://go.opentelemetry.io/otel" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">go.opentelemetry.i=
o/otel</a>
          v1.28.0<br>
          =C2=A0 =C2=A0 fd818019f5 vendor: <a
href=3D"http://go.opentelemetry.io/contrib/instrumentation/xxx"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>go.opentelemetry.io/contrib/instrumentation/xxx</a>
          v0.53.0<br>
          =C2=A0 =C2=A0 f009ed2b34 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          c23af2910987 (27.x / v27.5.0-dev)<br>
          =C2=A0 =C2=A0 0e053a5cee vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.5.0-rc.1<br>
          =C2=A0 =C2=A0 8b340f4e5c TestRunCopyFromContainerToFilesystem: =
use Tar
          without options<br>
          =C2=A0 =C2=A0 074820d7bb Fix cp test to separate source and des=
tination<br>
          =C2=A0 =C2=A0 261d2241eb docs, man: remove confusing example fo=
r
          "--isolation"<br>
          =C2=A0 =C2=A0 5d973da95b docs: dockerd: --oom-score-adj flag<br=
>
          =C2=A0 =C2=A0 f068c14063 contrib/completion: remove --oom-score=
-adj
          daemon flag<br>
          =C2=A0 =C2=A0 0ced103038 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          43fc912ef59a (v27.5.0-rc.2)<br>
          =C2=A0 =C2=A0 919350df54 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.5.0-rc.2<br>
          =C2=A0 =C2=A0 b277537cbe gha/build: Publish bin image for relea=
se
          branches<br>
          =C2=A0 =C2=A0 e32d69e31c vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          38b84dce32c4 (v27.5.0)<br>
          =C2=A0 =C2=A0 397c2f87d5 vendor: <a
            href=3D"http://github.com/docker/docker" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">github.com/docker/=
docker</a>
          v27.5.0<br>
          =C2=A0 =C2=A0 1ccfae7946 update to go1.22.11 (fix CVE-2024-4534=
1,
          CVE-2024-45336)<br>
          =C2=A0 =C2=A0 fa1ba052d6 gha: Adjust release branches<br>
          =C2=A0 =C2=A0 777695f6d5 Dockerfile: update buildx to v0.20.0<b=
r>
          =C2=A0 =C2=A0 fbc0a73b35 Dockerfile: update compose to v2.32.4<=
br>
          <br>
          Signed-off-by: Paolo Barbolini &lt;<a
            href=3D"mailto:paolo.barbolini@m4ss.net" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">paol=
o.barbolini@m4ss.net</a>&gt;<br>
          ---<br>
          =C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_g=
it.bb"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>docker-moby_git.bb</a>
          | 6 +++---<br>
          =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/recipes-containers/docker/<a
            href=3D"http://docker-moby_git.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">docker-moby_git.bb=
</a>
          b/recipes-containers/docker/<a
            href=3D"http://docker-moby_git.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">docker-moby_git.bb=
</a><br>
          index 9f45f175..b3f5effe 100644<br>
          --- a/recipes-containers/docker/<a
            href=3D"http://docker-moby_git.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">docker-moby_git.bb=
</a><br>
          +++ b/recipes-containers/docker/<a
            href=3D"http://docker-moby_git.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">docker-moby_git.bb=
</a><br>
          @@ -44,8 +44,8 @@ DESCRIPTION =3D "Linux container runtime \<br=
>
          =C2=A0# so we get that tag, and make it our SRCREVS:<br>
          =C2=A0#<br>
          <br>
          -SRCREV_moby =3D "43fc912ef59a83054ea7f6706df4d53a7dea4d80"<br>
          -SRCREV_cli =3D "d41cb083c352853f94b292a87df4859c4a96dcc2"<br>
          +SRCREV_moby =3D "4c9b3b011ae4c30145a7b344c870bdda01b454e2"<br>
          +SRCREV_cli =3D "9f9e4058019a37304dc6572ffcbb409d529b59d8"<br>
          =C2=A0SRCREV_FORMAT =3D "moby"<br>
          =C2=A0SRC_URI =3D "\<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a
href=3D"http://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=
=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttps;dests=
uffix=3D${GO_SRCURI_DESTSUFFIX}</a>
          \<br>
          @@ -64,7 +64,7 @@ require docker.inc<br>
          =C2=A0LICENSE =3D "Apache-2.0"<br>
          =C2=A0LIC_FILES_CHKSUM =3D
          <a class=3D"moz-txt-link-rfc2396E" href=3D"file://src/import/LI=
CENSE;md5=3D4859e97a9c7780e77972d989f0823f28">"file://src/import/LICENSE;=
md5=3D4859e97a9c7780e77972d989f0823f28"</a><br>
          <br>
          -DOCKER_VERSION =3D "27.5.0-rc.2"<br>
          +DOCKER_VERSION =3D "27.5.1"<br>
          =C2=A0PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"<br>
          <br>
          =C2=A0CVE_PRODUCT =3D "docker mobyproject:moby"<br>
          -- <br>
          2.48.1<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#9149): <a
href=3D"https://lists.yoctoproject.org/g/meta-virtualization/message/9149=
"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://lists.yoctoproject.or=
g/g/meta-virtualization/message/9149</a><br>
          Mute This Topic: <a
            href=3D"https://lists.yoctoproject.org/mt/111412608/1050810"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://lists.yoctoproject.or=
g/mt/111412608/1050810</a><br>
          Group Owner: <a
href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproject.org"
            target=3D"_blank" moz-do-not-send=3D"true">meta-virtualizatio=
n+owner@lists.yoctoproject.org</a><br>
          Unsubscribe: <a
href=3D"https://lists.yoctoproject.org/g/meta-virtualization/unsub"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a>
          [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">bruc=
e.ashfield@gmail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
      <div><br clear=3D"all">
      </div>
      <div><br>
      </div>
      <span class=3D"gmail_signature_prefix">-- </span><br>
      <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follow =
the
        NULL pointer, for chaos and madness await thee at its end<br>
        - "Use the force Harry" - Gandalf, Star Trek II<br>
        <br>
      </div>
    </blockquote>
    <ul class=3D"dropdown-menu textcomplete-dropdown"
      style=3D"display: none; position: absolute; z-index: 1000;"
      contenteditable=3D"false">
    </ul>
  </body>
</html>

--------------NAzkgbcZlULycJ0IMV6fmzA3--


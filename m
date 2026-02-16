Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5138AE63F15
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:17:04 +0000 (UTC)
Received: from 5.mo580.mail-out.ovh.net (5.mo580.mail-out.ovh.net [46.105.41.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24709.1771262223208934791
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 09:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=Du8k5AHp;
 spf=softfail (domain: piedallu.me, ip: 46.105.41.63, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.109.249.224])
	by mo580.mail-out.ovh.net (Postfix) with ESMTPS id 4fF8b11W4Vz5vrV;
	Mon, 16 Feb 2026 17:17:01 +0000 (UTC)
Received: from piedallu.me (37.59.142.95) by mxplan8.mail.ovh.net
 (172.16.2.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 16 Feb
 2026 18:17:00 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-95G001cb287660-db2b-4232-9f7a-d36fcf78589d,
                    56406BC51C322441719EFB98626FE52A09BB5D07) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 176.170.95.144
Received: from [127.0.1.1] (92-184-102-168.mobile.fr.orangecustomers.net [92.184.102.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id F02B116A068E;
	Mon, 16 Feb 2026 18:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771262216;
	bh=oQ//aMfesCqjel7lpQeFuJGLuxGR9bS85Pj3H2lHWcw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Du8k5AHpp+ld3kYwRAdJQA6XvcPcik5NlSQxMKA/87hShgKnMN6mWCRdvk1IoHDqQ
	 WTPOJQhYyAz6nO0Svcp8Tgbxgh3uEgiiRNf+tHqHa3xKXeL760B9pbs/Qb74ow4yGD
	 UCoa6GFAPICioEkyHMXhOitlCVSmR6J6cBl4JyA8=
From: felix@piedallu.me
Date: Mon, 16 Feb 2026 18:16:44 +0100
Subject: [PATCH 2/3] docker-moby: Update docker cli
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-ID: <20260216-upstream-update-docker-moby-v1-2-8ddcc5b7ff63@non.se.com>
References: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
In-Reply-To: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771262214; l=4585;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=VRfk2v9SAl0gVA54596vQrSUIYinknnICAWlIgCyyK4=;
 b=Khmgbeitlq+XZTaeEyhPRrSFeUMpGeGVxtZfXZt3pOroGIcl32lLMf3ig4OSjThL4EgM232N5
 +hGzNN7HkjMBE4aL4LHmUWvo5qIJ8hu7n37FtxOH8V0uNxke1VhQONH
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: F02B116A068E.A1496
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: 9dbec916-b3f1-408c-a801-d5c44dbaf365
X-Ovh-Tracer-Id: 5840324294867323101
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGTb6ybdVnCOVfnn75AFM/JewR/eD6gdkvGZE0tLCOOPaDhv08tDNKQ1y0jZxrsUTrt7tKm60/J5zoF0/APi1c1rRsspYRco9THDxMb7hydUeqRKRnLEcq1EXEeXW79qmE5ch3bjKdfino2qEwJLsAFM3TnRz3gr5Wh6fALK3akegMpfR+5W2ZDKziYDq0ahTAXSc0ovkDBsWIvslNtO2PaH4IA/NpPwFslHdIimERnvdQkmsSBJkYejvyCcJ5Qb8xCZ6Be1C+VE/VwRobu1S5iVOmWVA2FTA4dUQAuNqAJfQyrh794CR+BuaRd+P3ewxAGDJO1CJrB1MLV5vcxwiQqj3qYazArd4UwBlTeENW9kavRyzDIG31/LZ4p6ORK7iUu8Ywd0kSixFT9Iy9Op/84uCqOStpmod2HhlXAwStZ8P4pSuevnJLrfYGCCT44Vr7GO+TlAGDFdMehJiURDBBw4eYV4Qsm0IyEGk/KG+4NQNLaqjXhMQFGfwwauQ6AgvQXkUEch9acJPmCUdJnhS3SNWYu+TENR9UBdNjK5TP6I8mDtobVBgDLPE89F21Aqbdxds333QYfB2LfdBoZg639K1mIGV/KKxYVk/nE0X7MDuRleuqhsyt/uUhxY11qC9jbV0Yk6keriTu1jEmXbcuLduuqe7edco0qMx7FNCm9dQ
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Feb 2026 17:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9592

From: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>

Bumping docker-cli to version v25.0.7-10-g43987fca48, which comprises the=
 following commits:

    cdbfdc6025 update xx to v1.6.1 for compatibility with alpine 3.21
    4b0e7ba9db Dockerfile: update xx to v1.5.0
    d661d0449f Dockerfile: update to xx 1.4.0
    190ebb5036 update to go1.22.10
    0a98cba34b gha: update to macOS 13, add macOS 14 arm64 (Apple Silicon=
 M1)
    8b446aa5d0 update to go1.22.9
    a0f4097740 docs: dockerd: add documentation for --log-format option
    11634426e8 man: dockerd: add description for --log-format option
    024b3c1e9b volume/update: require 1 argument/fix panic
    718cd79a8a ci: update to go1.22.8
    24c47bad80 gha: update codeql workflow to go1.22.7
    52037f602b update to go1.22.7
    b26009a92b update to go1.22.6
    8a604b18a3 update to go1.21.13
    06e1305fd7 scripts/build/plugins: don't override CGO_ENABLED set by .=
variables
    a73610dc4f run: fix GetList return empty issue for throttledevice
    1924acea45 gha: set permissions to read-only by default
    6fb9a5b264 tests: fix other flaky `connhelper` tests
    956c112f16 tests: fix flaxy `TestCloseRunningCommand` test
    02b482013c vendor: golang.org/x/net v0.23.0
    e2dad1bd3f vendor: golang.org/x/net v0.22.0, golang.org/x/crypto v0.2=
1.0
    df5d652d99 vendor: golang.org/x/term v0.18.0
    82a04c86b3 vendor: golang.org/x/sys v0.18.0
    26850c6a89 ci/validate-pr: Use `::error::` command to print errors
    73b9f1c0fb github/ci: Check if backport is opened against the expecte=
d branch
    de7a473c43 ci: Require changelog description
    ef3b190da3 ci: set DISABLE_WARN_OUTSIDE_CONTAINER=3D1 for CodeQL acti=
on
    7e4a7b5477 ci: fix CodeQL 2.16.4 autobuild
    0dd60b064f update to go1.21.12
    a90d08534b Dockerfile: update ALPINE_VERSION to 3.20
    1fbc90faf7 update to go1.21.11
    c5aee98be7 update to go1.21.10
    d379797cec gha: update to actions/upload-artifact@v4
    f2918727a6 update to go1.21.9
    c2be159764 vendor: github.com/docker/docker e63daec8672d (v25.0.5-dev=
)
    690b1565fb bake: Add `windows/arm64` target to bin-image-cross
    833128bce5 vendor: github.com/docker/docker 061aa95809be396a6
    ce113a74af vendor: github.com/docker/docker 9e526bc3943c
    a3b6c9ea7e update to go1.21.8
    956d15c723 Cleanup of dockerfiles, compose files and env vars
    5a942fadcf Update gha runners and engines used in e2e tests
    592c146cca testenv: Add DaemonAPIVersion helper
    0735e78cc9 vendor: github.com/docker/docker 25.0.4-51e876cd96
    e0dab5ce1e Dockerfile: update docker compose to v2.24.3
    a25a9100f3 Minor test fixes necessary for eventually upgrading ci run=
ners and engine version
    c87c4c96ec update to go1.21.7
    c270556d44 Fixed typo in bash completion functions
    1cddb2b03d docker stack: allow '=3D' separator in extra_hosts
    8715d9a33a Avoid keeping @docker_cli_[UUID] files
    9142b58351 docs: regenerate markdown
    08eba2246c docs: update url scheme for reference docs
    4fd2cf5f2d deps: update cli-docs-tool version (v0.7.0)
    e456704864 vendor: github.com/docker/docker v25.0.3
    5428301e3f build(deps): Bump codecov/codecov-action from 3 to 4
    1cbc218c05 tests: add plugin-socket-compatibility tests
    2f6b5ada71 scripts: don't hardcode architecture in e2e script
    d8e07c9c47 tests: add tests for `cli-plugins/socket`
    62b2963b80 vendor: github.com/docker/docker v25.0.2
    71f2b0d109 vendor: github.com/docker/docker v25.0.1
    617bc98c8d Add Linode docker volume plugin
    4caf4de039 docs: update host-gateway-ip to use daemon.json instead of=
 cli flag
    6ab4781bd0 Dockerfile: update docker compose to v2.24.2
    4e097c643d socket: return from loop after EOF

Signed-off-by: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>
---
 recipes-containers/docker/docker-moby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
index 216353bd..dd6dac05 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -46,7 +46,7 @@ DESCRIPTION =3D "Linux container runtime \
=20
 SRCREV_moby =3D "f417435e5f6216828dec57958c490c4f8bae4f98"
 SRCREV_libnetwork =3D "3797618f9a38372e8107d8c06f6ae199e1133ae8"
-SRCREV_cli =3D "01f933261885c0126edb3f47fd56d048ae31265a"
+SRCREV_cli =3D "43987fca488a535d810c429f75743d8c7b63bf4f"
 SRCREV_FORMAT =3D "moby_libnetwork"
 SRC_URI =3D "\
 	git://github.com/moby/moby.git;branch=3D25.0;name=3Dmoby;protocol=3Dhtt=
ps \

--=20
2.52.0



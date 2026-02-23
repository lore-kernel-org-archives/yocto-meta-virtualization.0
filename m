Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB74CEC110C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:36:16 +0000 (UTC)
Received: from 6.mo579.mail-out.ovh.net (6.mo579.mail-out.ovh.net [46.105.43.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39342.1771864573430678739
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 08:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=tpRdEaw6;
 spf=softfail (domain: piedallu.me, ip: 46.105.43.252, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.110.58.47])
	by mo579.mail-out.ovh.net (Postfix) with ESMTPS id 4fKRLg25Jsz5w8M;
	Mon, 23 Feb 2026 16:36:11 +0000 (UTC)
Received: from piedallu.me (37.59.142.98) by mxplan8.mail.ovh.net
 (172.16.2.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 23 Feb
 2026 17:36:10 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-98R002b780ca65-d7bb-431b-a496-5aa2350f1909,
                    2C24A2C219CBC5CDE540945932125BCC2609A321) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 82.66.229.222
Received: from [127.0.1.1] (92-184-100-178.mobile.fr.orangecustomers.net [92.184.100.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id 5F67F16A068F;
	Mon, 23 Feb 2026 17:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771864567;
	bh=oQ//aMfesCqjel7lpQeFuJGLuxGR9bS85Pj3H2lHWcw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=tpRdEaw6SEbnDSiSAwopwNX8iTl/7fvbpL08U4oR4OiAT4iikKe9X/mVy3kvEAhPf
	 IWVkXIcRnY55No87kCFkbWsRwOXIrh2FB+9yLOy3n1mK/GM5fVPtIf7Sl4sx2+1csU
	 zBkjqASSqTw1fo5vr1eIr/GAVVwkpTz4RDsCxnDs=
From: felix@piedallu.me
Date: Mon, 23 Feb 2026 17:35:57 +0100
Subject: [PATCH v2 3/4] docker-moby: Update docker cli
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-ID: <20260223-upstream-update-docker-moby-v2-3-5bc0d679d988@non.se.com>
References: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
In-Reply-To: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771864566; l=4585;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=VRfk2v9SAl0gVA54596vQrSUIYinknnICAWlIgCyyK4=;
 b=7FMJ52ctnQebgViFHv0Qw2FHrLFCvy+YPVCrLI/5xl9jETtktRGXFyFLRkqAbhphOXxXnkNSy
 bW+AN5BE3leAX6P+E2az0lBoqSaQ5sGE+iPrleSOxHWxta0r9qzX986
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: 5F67F16A068F.A4164
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: e88f0fd9-9774-4a18-a734-4bc92a732530
X-Ovh-Tracer-Id: 9365798376930314461
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEeBvP91VnUksVFPDhajxPanIkXDk4JpEaUTYzkO5HeHJQGE1wbcc8/YrrnLMdTr9jKIJvDNR4ur8riIQaupMlhP0oBozC+S5OnwvRMMCo/va68/eBhI67xfjwJZkeOYTWcRTgzXYDcHDf2MoPLzuAjwSoYgkzG7Ib4IKJp8BmCH3AhltSPuChkIHSg8SavGR7oktUO5tHOOlaPsOZukLwVXoNH89YTKPzIgVGdPs6GvA8HvfguSOdTlyCNF1L+HaNBm77XNuw7VSnyenNHm4WbdgcN8m5V1cl3cNU7ntiLfLDPvlSaTkPi/eN/bFbMGq+WstYfz79GRcbZfsvZndS0N77i31TFxGjLO3AKLdLST5XC51r3892Jrxzl10ojv4CJgdL/hhixiMar6OQozfHztafHIDqbtUlo2/v28/X0TsTxXeVg6uOlFJvhIFzOYbRgMmNB7Kg53ffu6e1lbqQpYBwM491RlO3tIFw1jY+S8khhPdUGP/DZ55XvHq79HVw0RsGw+INpIhGA+OALAkFk6GiFgrLrfeRk8/xWiiV+HPscd2czfpYeT1W/aNkGkoOoBgKvELHj/lmSC/HY1H1D7ODjkI0gsekP42Ji4V1dfXTqqlQi4wB20lRZFgkspKuUQI/9aZOycdhC7htjwJ/FmwOZOfvPjFW9a9iGiFNMhg
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 16:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9608

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



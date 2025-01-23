Return-Path: <paolo.barbolini@m4ss.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9731DC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 11:23:50 +0000 (UTC)
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
 by mx.groups.io with SMTP id smtpd.web11.8511.1737631425027711811
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 03:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@m4ss.net header.s=MBO0001 header.b=UM/eEXsT;
 spf=pass (domain: m4ss.net, ip: 195.10.208.40, mailfrom: paolo.barbolini@m4ss.net)
Received: from smtp1.mailbox.org (unknown [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4Ydz8r1ZnwzDvXQ;
	Thu, 23 Jan 2025 12:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4ss.net; s=MBO0001;
	t=1737631420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R37K+h8yxbxqA2mcmibG8Dq5ozbpCGi+cJjekPu8fDI=;
	b=UM/eEXsTJL0+jc8FXyZoNyLFVROt317i899/Gh8j+AdR3J0UaoEVNJLBZ+JBBDM7bLCyDT
	GzGyTWxj/ESR/3QagS48hkBE7xA/TTLzdz12k+lXh+LkFirNuH6QCRPWely0kfQvnauRbB
	4XxBHMFF7A2obKw+AQoasrZspvFJRerTN2vmiTb2R9EkMMd3fqlUpD47MF1UWyoG0HlhLw
	v6cAMdkiG07Sy/kvbBqyYAGlukHHw1ccbDl4eBjBZBor51I5VMinxa3rAvwV0/l1CRMYmK
	MYc4GzuIJUNk7/Si7aB3eOKlk0OzMYzKpeJrY+eV0MGj03gavwIeUldMbC0DfA==
From: Paolo Barbolini <paolo.barbolini@m4ss.net>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paolo Barbolini <paolo.barbolini@m4ss.net>
Subject: [PATCH] docker: switch libnetwork to moby version
Date: Thu, 23 Jan 2025 12:23:19 +0100
Message-ID: <20250123112322.3970523-1-paolo.barbolini@m4ss.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jan 2025 11:23:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9111

Some time ago libnetwork was moved from it's own repository to moby.
This patch updates the docker recipe to use the new location

Signed-off-by: Paolo Barbolini <paolo.barbolini@m4ss.net>
---
 recipes-containers/docker/docker-moby_git.bb  |  5 +-
 recipes-containers/docker/docker.inc          |  7 +--
 ...0001-libnetwork-use-GO-instead-of-go.patch | 63 -------------------
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 recipes-containers/docker/files/0001-libnetwork-use-G=
O-instead-of-go.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
index b16f44fd..5cb504a6 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -45,15 +45,12 @@ DESCRIPTION =3D "Linux container runtime \
 #
=20
 SRCREV_moby =3D "33b6b826c26b05c5e68adc106b6c3b4b44ca5360"
-SRCREV_libnetwork =3D "67e0588f1ddfaf2faf4c8cae8b7ea2876434d91c"
 SRCREV_cli =3D "d41cb083c352853f94b292a87df4859c4a96dcc2"
-SRCREV_FORMAT =3D "moby_libnetwork"
+SRCREV_FORMAT =3D "moby"
 SRC_URI =3D "\
 	git://github.com/moby/moby.git;nobranch=3D1;name=3Dmoby;protocol=3Dhttp=
s;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
-	git://github.com/docker/libnetwork.git;branch=3Dmaster;name=3Dlibnetwor=
k;destsuffix=3Dgit/libnetwork;protocol=3Dhttps \
 	git://github.com/docker/cli;nobranch=3D1;name=3Dcli;destsuffix=3Dgit/cl=
i;protocol=3Dhttps \
 	file://docker.init \
-	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc=
/import \
         file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patc=
h;patchdir=3Dsrc/import \
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/do=
cker/docker.inc
index 8aabd154..4e2891b4 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -60,7 +60,6 @@ do_compile() {
 	ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
 =09
 	mkdir -p .gopath/src/github.com/docker
-	ln -sf ${S}/libnetwork .gopath/src/github.com/docker/libnetwork
 	ln -sf ${S}/cli .gopath/src/github.com/docker/cli
=20
 	export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor"
@@ -90,17 +89,13 @@ do_compile() {
 	export LDFLAGS=3D""
 	export DOCKER_VERSION=3D${DOCKER_VERSION}
 	VERSION=3D"${DOCKER_VERSION}" DOCKER_GITCOMMIT=3D"${DOCKER_COMMIT}" mak=
e dynbinary
-
-	# build the proxy
-	cd ${S}/src/import/.gopath/src/github.com/docker/libnetwork
-	oe_runmake cross-local
 }
=20
 do_install() {
 	mkdir -p ${D}/${bindir}
 	cp ${S}/cli/build/docker ${D}/${bindir}/docker
 	cp ${S}/src/import/bundles/dynbinary-daemon/dockerd ${D}/${bindir}/dock=
erd
-	cp ${S}/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
+	cp ${S}/src/import/bundles/dynbinary-daemon/docker-proxy ${D}/${bindir}=
/docker-proxy
=20
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
 then
 		install -d ${D}${systemd_unitdir}/system
diff --git a/recipes-containers/docker/files/0001-libnetwork-use-GO-inste=
ad-of-go.patch b/recipes-containers/docker/files/0001-libnetwork-use-GO-i=
nstead-of-go.patch
deleted file mode 100644
index f94f73e4..00000000
--- a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-g=
o.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 04c07804930faad708218a3134c81de06a9c742a Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Fri, 6 Apr 2018 23:58:22 -0400
-Subject: [PATCH] libnetwork: use $(GO) instead of go
-
-Ensure that the libnetwork makefile uses the go cross flags and
-utilities.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- Makefile | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-Index: git/libnetwork/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/libnetwork/Makefile
-+++ git/libnetwork/Makefile
-@@ -45,10 +45,10 @@
- build-local:
- 	@echo "=F0=9F=90=B3 $@"
- 	@mkdir -p "bin"
--	GO111MODULE=3Doff go build -tags experimental -o "bin/dnet" ./cmd/dnet
--	GO111MODULE=3Doff go build -o "bin/docker-proxy" ./cmd/proxy
--	CGO_ENABLED=3D0 go build -o "bin/diagnosticClient" ./cmd/diagnostic
--	CGO_ENABLED=3D0 go build -o "bin/testMain" ./cmd/networkdb-test/testMa=
in.go
-+	GO111MODULE=3Doff $(GO) build -trimpath -tags experimental -o "bin/dne=
t" ./cmd/dnet
-+	GO111MODULE=3Doff $(GO) build -trimpath -o "bin/docker-proxy" ./cmd/pr=
oxy
-+	CGO_ENABLED=3D0 $(GO) build -trimpath -o "bin/diagnosticClient" ./cmd/=
diagnostic
-+	CGO_ENABLED=3D0 $(GO) build -trimpath -o "bin/testMain" ./cmd/networkd=
b-test/testMain.go
-=20
- build-images:
- 	@echo "=F0=9F=90=B3 $@"
-@@ -82,8 +82,8 @@
-=20
- cross-local:
- 	@echo "=F0=9F=90=B3 $@"
--	GO111MODULE=3Doff go build -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
--	GO111MODULE=3Doff go build -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd=
/proxy
-+	GO111MODULE=3Doff $(GO) build -trimpath $(GO_LINKSHARED) $(GOBUILDFLAG=
S) -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
-+	GO111MODULE=3Doff $(GO) build -trimpath  $(GO_LINKSHARED) $(GOBUILDFLA=
GS) -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
-=20
- # Rebuild protocol buffers.
- # These may need to be rebuilt after vendoring updates, so .proto files=
 are declared .PHONY so they are always rebuilt.
-@@ -130,7 +130,7 @@
- 	if ls $$dir/*.go &> /dev/null; then \
- 		pushd . &> /dev/null ; \
- 		cd $$dir ; \
--		go test ${INSIDECONTAINER} -test.parallel 5 -test.v -covermode=3Dcoun=
t -coverprofile=3D./profile.tmp ; \
-+		$(GO) test ${INSIDECONTAINER} -test.parallel 5 -test.v -covermode=3Dc=
ount -coverprofile=3D./profile.tmp ; \
- 		ret=3D$$? ;\
- 		if [ $$ret -ne 0 ]; then exit $$ret; fi ;\
- 		popd &> /dev/null; \
-@@ -145,7 +145,7 @@
- # Depends on binaries because vet will silently fail if it can not load=
 compiled imports
- vet: ## run go vet
- 	@echo "=F0=9F=90=B3 $@"
--	@test -z "$$(go vet ${PACKAGES} 2>&1 | grep -v 'constant [0-9]* not a =
string in call to Errorf' | egrep -v '(timestamp_test.go|duration_test.go=
|exit status 1)' | tee /dev/stderr)"
-+	@test -z "$$($(GO) vet ${PACKAGES} 2>&1 | grep -v 'constant [0-9]* not=
 a string in call to Errorf' | egrep -v '(timestamp_test.go|duration_test=
.go|exit status 1)' | tee /dev/stderr)"
-=20
- misspell:
- 	@echo "=F0=9F=90=B3 $@"


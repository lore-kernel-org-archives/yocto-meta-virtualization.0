Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8C7C4708D
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.37859.1670831995471523611
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ivbQcC0C;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n20so25896533ejh.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMV8Ms6jpLFRtL3tsUAgqLfbDWhhmQr3kpTVCYlAATA=;
        b=ivbQcC0CsNtwa9XTaIyRg2qPQsRgw+GFOpfjbLVDa7eMFYdvtAwXt2llc749ygZnoG
         h6EojJjCgmcCOOHF/Yaypcf/agrQ0G9FGal4anopBTXJaJd/Tma5hM70oEiwQySYCDo5
         fWjeaiwAlLCpx4yqbuDnKLyfMf3dPI6nXFj9v/KaMacWv1a41OcZKECf0gGdFnHGDT9Y
         D41sgXuonMVg6hBu+Ipy3nhS8sv9JdEV0HgwbZIkFqvStezUCmGigO00A1Xe6eJrMrS2
         vyTlphK1vEj2R9oMK+GTQB/ZVqlKVFWU/q3p7LBB1xUs3KUKGHb6ZD49J138GPvzkMr6
         YZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMV8Ms6jpLFRtL3tsUAgqLfbDWhhmQr3kpTVCYlAATA=;
        b=AQeLPwoVBesGSkhaxuufx3OOrpOVJkMNCKCemYl7jNFWxhZ4gw9C3uPyu+vfgLmCZx
         Tv3+RYNC1/Ve+KNT3chIin//iWxDxBeNhQfHRacyvdsLTtuVPbf3wwjm9imIqo9oxTzJ
         tAGsvkJA5u8VGjEEVU1dkagbBEur6OI6iTt/FC7QZTwyaDINU1Z7ygWdrn/ctXeKHVCp
         I9yya1c/cr7iZReEpb06EST877KuXOLRJOJPMJ/FAz1kxgFrgQcO5quQk4jVbJL/8xLI
         7pE7iUAogJibridwIZd1JtzdHShBiXcXO0/ApFSRx0EHYLB9mjH5mS3Y6C5++8ZqLYT+
         SLSA==
X-Gm-Message-State: ANoB5pnf6PdpqVAPWVRZFbF2+wK+H1CX2DMaqRuXT2wYk13RzrqRgYCt
	jwwdenbcMe5ioTFgMzh3ray08PfwLBM=
X-Google-Smtp-Source: AA0mqf5fuQddoDHmOh1cmf03vwiBS8a34HfN6kIff+sFAcmhN7TxrW/WVe1mWMNcc3PsX+UTT/LHEg==
X-Received: by 2002:a17:907:80c3:b0:7a3:bb39:bdbf with SMTP id io3-20020a17090780c300b007a3bb39bdbfmr12976625ejc.50.1670831993550;
        Sun, 11 Dec 2022 23:59:53 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:52 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 12/21] docker: reproducibility add -trimpath to go -> $GO patches
Date: Mon, 12 Dec 2022 08:58:48 +0100
Message-Id: <20221212075857.1065221-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7766

From: Bruce Ashfield <bruce.ashfield@gmail.com>

With this, we build and package docker without QA warnings due to
references to TMPDIR.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...i-use-external-GO111MODULE-and-cross-compiler.patch |  2 +-
 .../files/0001-dynbinary-use-go-cross-compiler.patch   |  2 +-
 .../files/0001-libnetwork-use-GO-instead-of-go.patch   | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch b/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch
index 16b5f9e..d68de1c 100644
--- a/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch
+++ b/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch
@@ -19,6 +19,6 @@ Index: git/cli/scripts/build/binary
 -export GO111MODULE=auto
  
 -go build -o "${TARGET}" -tags "${GO_BUILDTAGS}" --ldflags "${GO_LDFLAGS}" ${GO_BUILDMODE} "${SOURCE}"
-+${GO} build -o "${TARGET}" -tags "${GO_BUILDTAGS}" --ldflags "${GO_LDFLAGS}" ${GO_BUILDMODE} "${SOURCE}"
++${GO} build -trimpath -o "${TARGET}" -tags "${GO_BUILDTAGS}" --ldflags "${GO_LDFLAGS}" ${GO_BUILDMODE} "${SOURCE}"
  
  ln -sf "$(basename "${TARGET}")" "$(dirname "${TARGET}")/docker"
diff --git a/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch b/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
index 971c60d..c6edaf4 100644
--- a/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
+++ b/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
@@ -17,7 +17,7 @@ Index: git/src/import/hack/make/.binary
  	echo "Building: $DEST/$BINARY_FULLNAME"
  	echo "GOOS=\"${GOOS}\" GOARCH=\"${GOARCH}\" GOARM=\"${GOARM}\""
 -	go build \
-+	${GO} build \
++	${GO} build -trimpath \
  		-o "$DEST/$BINARY_FULLNAME" \
  		"${BUILDFLAGS[@]}" \
  		-ldflags "
diff --git a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch
index c623b26..d4f84e3 100644
--- a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch
+++ b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch
@@ -22,9 +22,9 @@ Index: git/libnetwork/Makefile
 -	go build -tags experimental -o "bin/dnet" ./cmd/dnet
 -	go build -o "bin/docker-proxy" ./cmd/proxy
 -	CGO_ENABLED=0 go build -o "bin/diagnosticClient" ./cmd/diagnostic
-+	$(GO) build -tags experimental -o "bin/dnet" ./cmd/dnet
-+	$(GO) build -o "bin/proxy" ./cmd/proxy
-+	CGO_ENABLED=0 $(GO) build -o "bin/diagnosticClient" ./cmd/diagnostic
++	$(GO) build -trimpath -tags experimental -o "bin/dnet" ./cmd/dnet
++	$(GO) build -trimpath -o "bin/proxy" ./cmd/proxy
++	CGO_ENABLED=0 $(GO) build -trimpath -o "bin/diagnosticClient" ./cmd/diagnostic
  	CGO_ENABLED=0 go build -o "bin/testMain" ./cmd/networkdb-test/testMain.go
  
  build-images:
@@ -34,8 +34,8 @@ Index: git/libnetwork/Makefile
  	@echo "🐳 $@"
 -	go build -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
 -	go build -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
-+	@$(GO) build -linkshared $(GOBUILDFLAGS) -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
-+	@$(GO) build -linkshared $(GOBUILDFLAGS) -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
++	@$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
++	@$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
  
  # Rebuild protocol buffers.
  # These may need to be rebuilt after vendoring updates, so .proto files are declared .PHONY so they are always rebuilt.
-- 
2.38.1



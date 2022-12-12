Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C88EC04FDE
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.37860.1670831996499408207
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MjbySrRI;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id b2so25795676eja.7
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxQrxWlqq0hJdbBtuX9fEXe585HPCXmJKj3bKuvR+M8=;
        b=MjbySrRIKv9M7M5/gein5LzkSESlW9Q4RPjRYV34IXU7EMChAagxWNbyVPPZqN5OTO
         alLHhI1DR6iLwmQJs/siPvceJvYk7NDUBH082NqQOcfd+/pKt8r+S+RHl9UU6QbArWVU
         M4X8PrGrUlxqE3zAZzHajdnhpXSoAK7KcWioEmHtvq64JUJHRSMcDDztcHSwDz42oTiJ
         skLOYN0IiTC8rKs6nTBaXOgtDqzC0AHqhfmgvOUFTnymIPA7GD8h31xoRR2/HoHoO2SV
         koZFzOMMdPbCyT7mXfP9EKZUYSmL5zS31gFAsmx6oxolf0UGb3uJqP7wevu7Vn979m4q
         xX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxQrxWlqq0hJdbBtuX9fEXe585HPCXmJKj3bKuvR+M8=;
        b=6PtjD2iTAqJf5ut3YrZIHVkRtQw0hkXg7wDbDY1awXyAIoYhE9tM8AmlaWerV4mqzV
         5VLdsTyz+Mi31aOupePzSMztS0EhBj4JCBkw0nsIGUgUPdp7aH7OGdr88srdr8Gm/3O8
         i3/R5AGyXNB64A/kpWjuggmEgCddsqqyCQJ+pTrccsyudv/2dqohmQxhUaijzGMrhlLC
         fNiNMxX3+m6nGnlLnb55LLHiCRDQ1iNRFO26pp5+CI0zuPZ6uyyx7sBUxjqpUZ0XnTkm
         DOjKUVfHMa9/DKCr+yIaQD3zrqSpX3CsElAwjmO/A1K4SNQUYBVZWyGxo8cGJUmE8ku4
         wLBA==
X-Gm-Message-State: ANoB5pnax3CufVT3KF0JQg4K3HoA6aAf5TYtJrSdqZFVK9fqJf58Woe/
	L16ACQ3eZExfFxk7xSHiaAeExrYIjeiVhg==
X-Google-Smtp-Source: AA0mqf5IBko/oO2ggPefVpFZ01PsC5wnxqiKON1qAJtTIXdjk5sBkzy2fsiqAHwtF/5QS+raA8uSlw==
X-Received: by 2002:a17:906:fcd9:b0:7c0:9bc2:a7f1 with SMTP id qx25-20020a170906fcd900b007c09bc2a7f1mr13374511ejb.34.1670831994812;
        Sun, 11 Dec 2022 23:59:54 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:54 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 14/21] docker/proxy: don't use -linkshared unconditionally
Date: Mon, 12 Dec 2022 08:58:50 +0100
Message-Id: <20221212075857.1065221-15-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7767

From: Jose Quaresma <quaresma.jose@gmail.com>

The linkshared is not supported in some machines like riscv64 and
when supported we can use the GO_LINKSHARED instaed.
So export GO_LINKSHARED on the recipe to be available for Makefile.

This is currently only used in libnetwork for the proxy build, but
could be used in additional locations in the future.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker.inc                          | 3 +++
 .../docker/files/0001-libnetwork-use-GO-instead-of-go.patch   | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index b0bee4f..9708eaf 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -58,6 +58,9 @@ inherit pkgconfig
 
 do_configure[noexec] = "1"
 
+# Export for possible use in Makefiles, default value comes from go.bbclass
+export GO_LINKSHARED
+
 DOCKER_PKG="github.com/docker/docker"
 # in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
 BUILD_TAGS ?= "exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
diff --git a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch
index d4f84e3..b9b41de 100644
--- a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch
+++ b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.patch
@@ -34,8 +34,8 @@ Index: git/libnetwork/Makefile
  	@echo "🐳 $@"
 -	go build -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
 -	go build -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
-+	@$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
-+	@$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
++	@$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUILDFLAGS) -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
++	@$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUILDFLAGS) -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
  
  # Rebuild protocol buffers.
  # These may need to be rebuilt after vendoring updates, so .proto files are declared .PHONY so they are always rebuilt.
-- 
2.38.1



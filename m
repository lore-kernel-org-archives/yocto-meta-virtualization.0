Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.7490.1625219986852260839
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 02:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JIWUy5rS;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id i20so14930678ejw.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Jul 2021 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=74QmvwGFFP/8dvaXnpZzoMmEbuWF5uMzGxgg0tx2arU=;
        b=JIWUy5rSMmZsL7bmYsOQzkyNxjKVkbtKRjvoyIy569fPlF8j1pdLLyPOaiBAFQXk1H
         I+vQP4z2pTvXATr1u6XfR9cfllSW+/wpMO5iupEhPKH0mToKFnxpoTXRik45/Yn2Pzmb
         JVWKVcKyQjyDYf+lV6XeNpljUBpgLQ9sb6Uq0gQ6Y4Nul1/B0cNGndkwCamZw4kXzpaA
         Tw09No/k4kK6eznXauHiYUaGrgg2cYq7w06HoMacWl6Sq6Tyd0HhyiIsv+KRMAdib7/K
         h0aizu/wvfqFBI7vR55sekq/4lLRBFYoDHhbh6IytRVsOnVgdcuUxOzzljVwvOeblDYy
         WVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=74QmvwGFFP/8dvaXnpZzoMmEbuWF5uMzGxgg0tx2arU=;
        b=L3wPrg5e3YDa1OZqkzI0yjHeylMxROnbdFo3UmaErbQRJ3NR7v4ta2If2P33/Ta0cZ
         uyPLIZvNWAP1vBxgKP8WQHOysMz6H+lBq8tXyZCO3JLLrZi8tWInnbD5hCh28LPzlvcn
         2YIKJb4DBrrY29BvDHKN+cVPuD892Iklv98gbYEHt2xkd05m53cPdW3jLDHgT5dmXiIE
         uEa5E0t4iAxJqsRVf482ZmxxZo3TXxY+Hlwlw/eozYun6v9Dp2QGIyWluU5+iw1wzlsF
         qJeML8l7QMNHIZucpuloRhN+xOQeDHlChcgRbjg0OfJ9KH5cMmiMFloc9ZB7k7VnjEo4
         +CTw==
X-Gm-Message-State: AOAM531ebMTTHHOlA6AQoBCr87co+PEIUra/sZzVCRegqwHMPRKMs8tc
	vsCgLcm4mwngsSMSSfrolwfaoCNDg+Q=
X-Google-Smtp-Source: ABdhPJxZX3ilX4QT9/hdbn0OtSqyYHKIh20IxqM9SuV6XaRl84QYEl/k07oluk6m6JP2kQeF2vCHTg==
X-Received: by 2002:a17:907:9496:: with SMTP id dm22mr4529490ejc.437.1625219985336;
        Fri, 02 Jul 2021 02:59:45 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i9sm851100ejz.57.2021.07.02.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 02:59:44 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] podman-compose: remove pypi inherit to fix do_fetch
Date: Fri,  2 Jul 2021 11:59:42 +0200
Message-Id: <20210702095942.1303820-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* now when pypi uses SRC_URI_prepend since:
  https://git.openembedded.org/openembedded-core/commit/?id=8f17b8bce85efb0e9a7e15d0b98a5cf7b6bd9750
  both entries end in SRC_URI (because of delayed nature of prepend):
  https://files.pythonhosted.org/packages/source/p/podman-compose/podman-compose-0.1.5.tar.gz
  git://github.com/containers/podman-compose.git

  causing:
  ERROR: podman-compose-0.1.5-r0 do_fetch: No checksum specified for '/OE/build/oe-core/downloads/podman-compose-0.1.5.tar.gz', please add at least one to the recipe:
  SRC_URI[sha256sum] = "fb229362f188980ea3fbdee2a25d0a2dd6a0b886d925d5213e22e09f1062ebe9"
  ERROR: podman-compose-0.1.5-r0 do_fetch: Fetcher failure for URL: 'https://files.pythonhosted.org/packages/source/p/podman-compose/podman-compose-0.1.5.tar.gz'. Missing SRC_URI checksum
  ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/podman-compose/0.1.5-r0/temp/log.do_fetch.55855

  drop pypi inherit to restore the previous SRC_URI with just the git:// entry.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/podman-compose/podman-compose_0.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman-compose/podman-compose_0.1.5.bb b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
index bf91705..1b91a92 100644
--- a/recipes-containers/podman-compose/podman-compose_0.1.5.bb
+++ b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An implementation of docker-compose with podman backend"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit setuptools3 pypi
+inherit setuptools3
 
 SRC_URI = "git://github.com/containers/podman-compose.git;branch=devel"
 
-- 
2.30.2


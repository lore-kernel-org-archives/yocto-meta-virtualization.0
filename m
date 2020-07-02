Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.9606.1593704355668622916
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jul 2020 08:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bu7w703g;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id n2so15415098edr.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Jul 2020 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PWq13Ob/HBpDlC/Oozm/dvCfitpucXrQFx52l93qQZ0=;
        b=Bu7w703gSNqlLJ/Bgfe828dOth4wLEaE6YbU0DRWmBf3ZpuLxxcyrKMM0MyinjWvQ9
         765hKV7r1xnY3yAzxY49gBdW9j+lLAPQrpFIqEgq0aqoiX5V+Q1bv1yXr5Ac3wGlLU79
         fV/rXsymVSSQxeO6v2Ol9lK2LrPhCs8pNqVohXu5MmYRKJtmeXsdh2s9dVpbBn82l5VK
         oNBlMZVJaokjdO4xM4DzM6oLzIhEpYQbQ5lKxrYr36LzofssCZoUfOtjrtU/Z2OYUVpY
         4OB+KJArHVRmKGHjS7/oWNlHrMI8+uwwXZfeJvEi6N7TWSu6Jr9/ExndKuVOADMnZEy5
         n3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PWq13Ob/HBpDlC/Oozm/dvCfitpucXrQFx52l93qQZ0=;
        b=AZGJLskXFZmm2fYQFvr2mWuAoPrAad/mtc753Reiy2MJnGoITQr4J71mIIxXTgLZ1G
         8Fxlxyk9XMdIVHQLJvKilKyfpOSGJUBva/MTY0Uwbbrm7r0d1xYHwi2vykHKF5mq8Jhw
         GfO2HA6R6sI2qrQ5rXrLPnqZaLQYrJvBq1fzjOMvaJzJ/uWb8avAdnedF8bMvQ9KPm8V
         AF2cZE/qOjsPS9ErQ+fv0ldWzI4V2lacJ1T2fAinIIi/mrpkyw71pXjBDkMPqY95Miqw
         1Qz8ftdl+0UPyLQuAz79J+9WvJwjipZJ31r4oKm0wD03OGWj2z7GgUDn8da993vAtRIi
         N28A==
X-Gm-Message-State: AOAM530mRNqWwbyOFVbV+tx4zaYEkueqRDRBy70j/7O16eCr8p/Norg6
	3zLOUQUstRKGkpfrH7tqLU5fCwy7
X-Google-Smtp-Source: ABdhPJwhVpy59xj0CGahSDudjWVLXoFEOLO8kQHLlXPdBSD/z3RhXOd5OnqN807WhareH+Q0Vs4T8A==
X-Received: by 2002:aa7:d650:: with SMTP id v16mr35454531edr.361.1593704353933;
        Thu, 02 Jul 2020 08:39:13 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b4sm9357975edx.96.2020.07.02.08.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 08:39:13 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@lge.com>
Subject: [PATCH 2/2] docker: move docker.init back to files directory to use it from docker-moby
Date: Thu,  2 Jul 2020 17:39:07 +0200
Message-Id: <20200702153907.75805-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702153907.75805-1-Martin.Jansa@gmail.com>
References: <20200702153907.75805-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@lge.com>

* it was moved for some reason in:
  http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=929372946aeb85953d1ca6acc428d73fbac52a56

  but docker-moby uses it as well and now started to fail with:
  ERROR: docker-moby-19.03.12+git9dc6525e6118a25fab2be322d1914740ea842495-r0
  do_fetch: Fetcher failure: Unable to find file file://docker.init
  anywhere. ..

Signed-off-by: Martin Jansa <martin.jansa@lge.com>
---
 recipes-containers/docker/{docker-ce => files}/docker.init | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-containers/docker/{docker-ce => files}/docker.init (100%)

diff --git a/recipes-containers/docker/docker-ce/docker.init b/recipes-containers/docker/files/docker.init
similarity index 100%
rename from recipes-containers/docker/docker-ce/docker.init
rename to recipes-containers/docker/files/docker.init
-- 
2.25.1


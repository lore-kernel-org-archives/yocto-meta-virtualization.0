Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.39947.1578932150302712212
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 08:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dLIFiHLw;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: brendank310@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id e5so9541473qtm.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Jan 2020 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UiVZkqxYWUZCfAywGcOhZp0bbwE1qyQQ3lKdhxQwEkk=;
        b=dLIFiHLwqDbUdNLbktzw3/lKeXuAYgIYiBa0EmGDGusDzglhKPUGvggj3nOGYi+dVu
         9LtaHoBCiFeVdLK4OUE67fqD63Ec189NRxTj0j608GkRVYOgPSOgRgsAHq13F0OSz7WX
         yVsxYjB+0jIuDB0IL8oCUw9qnF6rCEvqzsclqfCKf7yRfeNUxakke0rbMqoXxaKfDX/B
         5cTiWt+GPyinFuOg2/4TOjY3L98MKyk0JfYFFmoZDl8BpZgl+I9cVPxzR3EnkwbyGqw2
         hRpnYzmWkI0z+fm5d+qCnMIqNiSzOVW2wVga6CuJD+LRwVFh9LNwOEJCUAGdWyZX4l4X
         5bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UiVZkqxYWUZCfAywGcOhZp0bbwE1qyQQ3lKdhxQwEkk=;
        b=uQKGawNu8gllmQNHjxhpT+NYf5Uh9iQiwEruBxQvp4yuHrq9USWWbKSO0AFlXHhl7M
         KhJqxLCB11J4mINHkkUOqPBnwOz28p12z+D53WkBgKedJFJUN8Ko6D0gXQunoSzenko5
         wm+wYBNNo0SCtpFivY6F8hHrGJ8Muds4JNoL9ZHZNREeyPi2ocrCMR4zbTQ6Ylnn9wa3
         kBmlgyC2OmzAE9iQ79dUjW00GvquCOWINObu71f/QUfQjx5T7TLZ1UAvnbSBkc2optbB
         HBbgBPvrAWkNfIYg5Rx1qGQoWerqZSrXfzardmARvJGqzYjzZ+bPKAGLeWkndg4qaBQ+
         UBRA==
X-Gm-Message-State: APjAAAUH0Lm8++5/8p3DI6KH8x/nnL9xlLN4M4R9QtA8yLVs1roLf09t
	Q0iKfdP6YqxqwUr9PeOKsS4+eQGy18o=
X-Google-Smtp-Source: APXvYqw2dhUjlbVuQ69bja2UdIc41HSRjw6CuXuMuiOq2Nbdk3Hi3hoEa1OXAR7c9sF45W0R7jG+8w==
X-Received: by 2002:a05:620a:48e:: with SMTP id 14mr11982961qkr.292.1578930490791;
        Mon, 13 Jan 2020 07:48:10 -0800 (PST)
Return-Path: <brendank310@gmail.com>
Received: from localhost.localdomain (pool-96-249-236-140.nrflva.fios.verizon.net. [96.249.236.140])
        by smtp.gmail.com with ESMTPSA id r205sm5150459qke.34.2020.01.13.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 07:48:10 -0800 (PST)
From: "Brendan Kerrigan" <brendank310@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>
Subject: [PATCH 0/3] xen: uprev to 4.13.0
Date: Mon, 13 Jan 2020 10:47:39 -0500
Message-Id: <20200113154742.15509-1-brendank310@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Uprev xen to 4.13.0 release

Brendan Kerrigan (3):
  xen: add flag to ignore warning "address-of-packed-member"
  xen: add package for xen-ucode
  xen: upgrade to 4.13.0

 ...01-python-pygrub-pass-DISTUTILS-xen.4.13.patch} |  3 +++
 recipes-extended/xen/xen.inc                       |  8 ++++++++
 recipes-extended/xen/xen_4.12.0.bb                 | 12 ------------
 recipes-extended/xen/xen_4.13.0.bb                 | 14 ++++++++++++++
 4 files changed, 25 insertions(+), 12 deletions(-)
 rename recipes-extended/xen/files/{0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch => 0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch} (96%)
 delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
 create mode 100644 recipes-extended/xen/xen_4.13.0.bb

-- 
2.20.1


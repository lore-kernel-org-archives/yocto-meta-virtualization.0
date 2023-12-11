Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F893C46CC5
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:53:32 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5001.1702288408725640867
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 01:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SmiNAClV;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50bef9b7a67so4735029e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 01:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288406; x=1702893206; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VdiXzhIMiblbLKbTLpkISy4XzmQsNSGHG/xzpLqFLGM=;
        b=SmiNAClVrnc53zDo6MhPk/xn+1ajx+4awceDzg/bHLwWhK1O3Kg1qeh1QDAQFX4tlO
         C50o9smIpUTWMKRlMgA+Ph4Jd91e54gtTOWppcv9ElP5tST+1vAELTrUmDvqF7+oWuae
         gAJ0OoOdoMbubwbMjcQ4NW3IoVPATc7GQPLWfgG0EOVLk+g++IW/FQmV3W7uX0IbwhFo
         H3+ewiTF6tdvtPiwkcXpSyY8+Ylyb8KVKisRvsNRGCew1iKvTaTaNKSr2npOR6VN5cyF
         CeTakIhE9Q+ZBK/GWzaILxXa5384loN5abyfwWLYTWkX7PIy05HyVINFfJYVA+TGi4gR
         5gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288406; x=1702893206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdiXzhIMiblbLKbTLpkISy4XzmQsNSGHG/xzpLqFLGM=;
        b=PMAop6nQajYINw6pW2PBWb47QZUxInp1wokLsjApxh8VUzrstid6NxIjZIL0GwDISK
         lgl12r9A1yZQFYHVPRg2PzKdhpvEj28RVJX5vnwtAzzQjPa3MgCOO2VFxNDa1ccFN1vx
         14fBfeWuAXW1ZIcdtID20lg0QCzVVzm54E0qwdcJLZ5JfJj+ZpN4dpmIBzs7vd/ucCqo
         a+kZ6+I+xS32U95Hf8LeHnzEyv1a01NOLnLoKSQOjKnebmvckKSvDRFICTDUB25sUt/p
         VHcP6YlOSSiWbcy3Pacb1X77SVebxpXq/Y0sI/M3Ec+0iXKaWMY3MGsUH45WnAkvile5
         zG+g==
X-Gm-Message-State: AOJu0YwrLpdS2ZShT/PIaLj/o+fHC1/Nbk97ZdLRSNjfgQpTGVJ3n898
	eQpE1Gd+2sjVT0o/5wNH+s9xdD6DnvI=
X-Google-Smtp-Source: AGHT+IGTOYM0xSVDveTP/1NMChi+HqkfncS6F6h8YhAHXOtKAnGKr2amObVYbMKf1qNA/ZNVd7YpTA==
X-Received: by 2002:ac2:5feb:0:b0:50b:e3c1:c99d with SMTP id s11-20020ac25feb000000b0050be3c1c99dmr1342469lfg.61.1702288406029;
        Mon, 11 Dec 2023 01:53:26 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id h42-20020a0565123caa00b004fe202a5c7csm1031696lfv.135.2023.12.11.01.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:53:25 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [kirkstone] [PATCH 0/3] cni: cherry pick fixes from master
Date: Mon, 11 Dec 2023 10:53:17 +0100
Message-Id: <20231211095320.10874-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 09:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8491

From: Ming Liu <liu.ming50@gmail.com>

We observed some library relocating issues on cni recipe, cherry pick
some fixes from master.

Bruce Ashfield (1):
  cni: reproducible builds: pass -trimpath

Changqing Li (1):
  cni: clean dir ${B}/plugins before do_compile

Chen Qi (1):
  cni: fix textrel QA issue

 recipes-networking/cni/cni_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.34.1



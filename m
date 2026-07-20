Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBE9C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:38:00 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9062.1784583473880341128
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D9qeXiYJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9725084c547so3226489241.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583473; x=1785188273; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=D9qeXiYJgdtUFZYQKfkXBLyIW74JEhW+v/U8DJqBW6EJT/jXSHzRMv2HFI6PVl88XW
         JQ8B/pf5Vawm7OK4v3A4wO+6BWHhO7auQOS1oWaYZDhfbTUzHXjB7ypA4LjwSSSVFUwk
         ZHGNpNNsULoQxYyKGaAnYsHj17l5DPcsht7r44ZjiNALbTVqniYYkFENAAfcaZuvuaBP
         lIyavO820yEB7RhOZnKi4MpTE3bfvS6nurn4fQmQhgsoXK80t+XwXDBNIa7gkF30T2lM
         b6ZDwsm9w2RXlPUxHMdEheMRjoBnh/AewnZdXnc5+w1fW4yDbijuWdsZAKaIzk/FT78w
         av+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583473; x=1785188273;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=nHJYX6IQ84a0uH2pPvfw9Tcg/tbHSDvY3GAu8SFvtACpN15FaFtbuu3q+b4YtHrhys
         8RmTdpEuTWsFAF/r/RAdBX+zNX1kPZFB6XkgZ6Ul6W6xKbVywBgWvFsvFFSPywPoJhOm
         woMsZRC7ceKn/T6lGr6ve2bScb8C+q/aV/cCOx35onGBWb4fL1zCJMp9jIZWCicGJlSt
         /H0GUmz61cGItilWpzENYQXJk4XXi6c+jOpkT2QktdfmSbbk7i0bf4nQYzK/OijgxrFL
         dByUGpccf8/1e6sYHqSrCxJZUEpswIwhM6ocZw3cuOWkFYADPONGgSHaIcQqdScqjC7H
         Q1gA==
X-Forwarded-Encrypted: i=1; AHgh+RqzO3QcDCS3WuJ3PDoMp71VD5muhRvLyTaS94G5RUAfV3XSTVSu85M/sds9ov5gz7c8GhG0Vbtr5ZNphTKfU92p+EMi@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywc91vGvm/eIS63jPANs+GU2qOcdouZ6KLZy5tFJNa8zIdDrn65
	D0WMc/FbB+jrF6DFY/bEc93Jrsl96kWcOBREiwq8rq+fiC5YI75ryXi1
X-Gm-Gg: AfdE7cntFimKpEpHf5IX6hEOV1IPRJDFZELsV7K1bdxBhyjMhrbKwDD7iHFPTemSXhG
	NifVJJE/A6NJYvc+Ur7CZRAj73zi/EgWGgD69iIV4zQ5iXfxvKFgtTOo6A8u4SpqOb8Iv9PDD6P
	LB+4B7aWssKdC7f+DS7yDjplPh0uUHHeA7s9nE8Zmekaq++IVf2PX6K8CbBiouVjfgGBuwS7Ald
	8fKwI1IkdNaDB/+q57BcgaRf2DygX/vLKp5aL8U+eY5do9r6zfVAmn+01iMQivEeh/yrIt2sY8Q
	rEv+E/2sNYGTSXKmzleZdCxKweMKS0iX5BCPook7eIrMiM+q3puTklJTFWc+qUVQhVCvu/RIvWs
	sJUeLvkUGhV8Cg4S8OSAl0d3PITS80SKEsC1Sjf6/Hdo/74UFC2T8kY+zJObKc4EiWhHZ8LGIJV
	YkZFIsUVylp2Mmpt+p3/qypaWun38yiJEErIFWB7wSdrhq49oE+vraHRTX0D1xVw5+W9aqRG1O/
	2HxrSBQQT0yg3M/HxQDepTu0C8rrrqdF7C3167YqFOAM2bQh+9CYl2yhY/nxv/BnjqUk89qhEDh
	LbA0lR0jZVnN9g==
X-Received: by 2002:a05:6102:5487:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-74753668b30mr4844664137.15.1784583472676;
        Mon, 20 Jul 2026 14:37:52 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757c8048csm9760854137.0.2026.07.20.14.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:37:51 -0700 (PDT)
Message-ID: <6a5e952f.26dcea81.133572.912d@mx.google.com>
Date: Mon, 20 Jul 2026 14:37:51 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] runc-opencontainers: fix
 CVE-2026-41579
In-Reply-To: <20260715172756.1154974-1-deeratho@cisco.com>
References: <20260715172756.1154974-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9967

merged

Bruce


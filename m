Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93056C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:09:37 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1372.1785258568461155521
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kxmPxPSK;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso9800e0c.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785258567; x=1785863367; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=kxmPxPSKH7S+/Z5VMa1x4f3XfdTQ9RzJfT1U8RJh8Rx1HOK1q1c19lr6Zdob5mFDz5
         H0ubPFrp8R+ufEErEDmuBgPdaPnyV53OgROn69RqJ8hcwayIkV5BpW7h/DSvUNuDnEGX
         rIHWsY6zUhs7MgMFrnNLlErmk8q0xjIdGtE81KbNo36f3S0nh70p28pU+5virR+s/H0w
         SluhZmo4A1KYEvSoM1OWUd8eqcHVhEIq/B5DhyE+X8wD9731uJBtKNg0wxW3VcBRiEZj
         EeghYi83pm3n2iO6hNccVhSWq/kRfJSo+QpfBFuLmxiQ4abh40lQ/KOOlSUGeaXZnXMe
         Zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258567; x=1785863367;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=N7FCPDi8SqlBGIgGi+Ew0nWYay5c/DDEdtWQmjF3oyKUNnAW0rZPdE5GYvBJYpICtQ
         dIVND2YTND6vgaNlnC0nnOdby40V+Ri9f1kVxh5b67U0ztuNM0qLYPo9VM76dtCWyctk
         gf62Ez1JBoQfSzLWjZru4xpXs9t1cdmBUcbW7CMEak4rLtAPpkn0+IFahZikXSXK3mtu
         79rPbWiFZED3OdDM2wSSraOvd5EiBTPbr7Gz3nTO0ej8P2FCrLvPDFTmdn1vL9/96FRE
         gGpOUBJlk0f2DpC3DS1dCScxASQZjZrFi6zOiPZUHSe75tXQv6PvYrcfSni2fxEXM+FV
         z0aQ==
X-Gm-Message-State: AOJu0YxcX7i9rU5fNJcWgnjmAo7/4HNOJjYBkU2pVgJAU82y9vvjNH1D
	u7g3wEkT+z/9bGVzR5OBtA/qVKOSbJtr3WrmVw1xlSLUwgIbi3eGyiclQkyMJTqt
X-Gm-Gg: AR+sD12HuWVbzqmgJv2bSQkfJWSOymaBUXcldsPVB+oWkNBiehdYYHT4l4XPwXKmoXw
	BTdA2bQPAiOo6sxPBv95m896NB99ArvDswKK1x0CPB4kHy17VTOUfsOD1Lz5redjHQ10m4fXfbT
	rrBhUZjtmaQHKEkvId4/TdQX5CTDKEMW+Pfutnblg0KnoQd0+ebpvJlClxa+xapHACr+z1xUBpa
	Lwdq6x5feZ2g2/Gt8wd/SysbG45EcT5lialdGbYhpJ2gfidrC5hyFCj8TawyexP4//pYR0Y3dTL
	lqruvV3B8CKKv6+Oo1h4JoBhh5q0t93LB++awZhi2wHwtjYuBMWLgboxCkxtWfo1e4tJQOqPkUl
	IEXpaV+JNOKmYje+BnEUYpHi4PXIusqoHj1buiQ6QPFQPtASgopuoHvbUqxz5iCt7jILGwj5i8f
	mYagdEy4BOrTvumeBzCMy+i3cjha0mqEEkAg6z95zeXAxRcUeVu1tamE00y5czlkAxUGBYkzs3U
	sTvGJtfvN7ICTLKxAaGqovWOTIGtXDFkfFU0T2LDED/yisty/7yt/mwBT7/f+VXv5jHYZNJynpf
	v9c=
X-Received: by 2002:a05:6122:1d8e:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c33f8e05c6mr1833210e0c.1.1785258567458;
        Tue, 28 Jul 2026 10:09:27 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34d6fd5b2sm243555e0c.10.2026.07.28.10.09.25
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:09:25 -0700 (PDT)
Message-ID: <6a68e245.29a90e65.1017b7.7a24@mx.google.com>
Date: Tue, 28 Jul 2026 10:09:25 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization] [PATCH 1/3] vrunner: add /sbin,/usr/sbin to PATH
In-Reply-To: =?utf-8?q?=3C51de6e987d775747a9f0588705837aed978f58a4=2E1785110?=
 =?utf-8?q?917=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1785110917.git.tim.orling@konsulko.com> =?utf-8?q?=3C51de?=
 =?utf-8?q?6e987d775747a9f0588705837aed978f58a4=2E1785110917=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9998

merged

Bruce


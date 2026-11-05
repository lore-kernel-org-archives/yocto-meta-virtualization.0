Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103.1793896165095606071
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 08:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jFlyLrv3;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7ce77f98658so664055137.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896164; x=1794500964; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qpRHt/6SNknSWRt03OsuOZdmGd2gU45X+zcnbuA5wo8=;
        b=jFlyLrv3ipbW0Z0VHsI9qEUbP6KX7XatZEnYYQVgPQYet3Z5UpZ7SHDD7PI+/m7C/X
         ur+BCPsaAhCtqtj5mN5IaQ5jOS8XnGJHF/qul5zy2EAt4WmyZ5rtRyxofgmm+s9/ibAI
         ILg3Ad5NVkhsrabWJ+AilO/MvcM8oTIH8iDAE7ar9Cje3oc+Ni9XoN3gA4X4EnwpRzJO
         iWZqkvWR60q7axdB09Ti/gFkyVY0bjWxBPW3UA6XUx95tmF2WEmRO0nUoWBv3D+gKSo1
         9pXmxbLS2VT8crR5B/EYW+U+08dAQEHJB50qMHcIKDUJhUnS3qFooFRAzfoLuAuAU1/V
         VCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896164; x=1794500964;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpRHt/6SNknSWRt03OsuOZdmGd2gU45X+zcnbuA5wo8=;
        b=qe+PxSsDPAvSXgaYQJ2NJoZDbp6MFpep/rXDCNsz3hBGxhmCeJx8B9/Ys1Q+8S4Ine
         u/ypFbIB6J9E1BMYtTqdbydZG9Ods/wYR4lq9i8ubOfiNyPinSMTYAN8xw/6DYkHkjjs
         8aM1u1lz2mDlUTWzIQ0OX9dnDP9TPcMNWMeNjwLRovJZx6TW7nsG7NaG6nklM+f2wXEp
         U/1OmpfOUS69pdgCoGL3QrpOrcwufxca2ulSNoqpwYql2+R3SrQDVhkZu5/J2kkkGvz7
         DBvuqhrVDKPyFc3D0G6NaYYSNToqctPbm1VDhx35fc4RdC2ycaw0/cg/U9+3gdko1XbS
         o0Fw==
X-Gm-Message-State: APuU4Z9UK0dVAfxiHQoUSBdi79BT1rcAxXw3DMR0xrCJVnukvrFRsU1t
	L3/MGELXHZEovJgVFd6J7Uns2f0FxTE0+a47hK0QtFbUK1TdFWeHMk62
X-Gm-Gg: AYBFou2vqKJSgiI1buF3aPoCjohueMaKneUZUI+GXOZ2TdfjTdvpUshC715qF6PEyvd
	s6R60Po2hP3kLsz1WqZeRdTzJ9yio8D+PoaYW1GJsrI80OCNrqf9BIfrwp7f03lFK1jeOYsrQ6X
	Du7TkRKHts3uLPm67BSlntoKKYVkhLsOjhkrVS+ZtahT1iIwRORbStFWEIBFzBtnxnuwxtfG67d
	TCkB7cUnnPhLEy156mj1dsUi3YbApD15oPXRYZnxgGumOTktvtMt45gXbe7YeiOobywRf632l6e
	/qrEgZrD6XCOJtU4ZRhpg9GhyoXYiK8XUN4SapnUsLqEuMcMb6P/M01qLy41RG4bNSa7Wf4QwVH
	xv00i3S/IRSwPjuzwv7Fga3GMUFxk/Tu9X5feSPXrROBjAH+g2kzwZTfx7sSf2hWHIDCAaqWsfl
	OPHhYrY3cRdaIqtDDedrvyBp7f8jvHg4Yy8KhlhA3DuprnNf+5sMLg7RWnC27ZHIvGbaXtyxiS9
	wDqi3eIjPd6jk+NSD0mz6hyalzPuaOxCcjmwSqkiOZMtjKlKMnlqUSluYK3QuUbpvfqUjaMsn1a
	vefethysUo5xEaPTF7fvt+OTQ3pZU5HC6IZAYhzbq+A2k1hQQxE4gFlYpmakMCQ95veFEPGcbH6
	YhXJ3DgFAobewXLglCv1YX6vCCl1ZKpKVrqA9V+EndA0gG8N3jo7V
X-Received: by 2002:a05:6102:5121:b0:7cc:9d82:61e2 with SMTP id ada2fe7eead31-7d2a152b540mr41339137.13.1793896163478;
        Thu, 05 Nov 2026 08:29:23 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b6568sm4819843e0c.1.2026.11.05.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:29:23 -0800 (PST)
Message-ID: <6aecaee3.d56dd9d0.9301c.8eb7@mx.google.com>
Date: Thu, 05 Nov 2026 08:29:23 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: set status of several CVEs
In-Reply-To: <20261029194748.3069710-1-peter.marko@siemens.com>
References: <20261029194748.3069710-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 16:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10153

merged

Is this applicable to wrynose as well ? If so, let me know and I can
apply it there. If it doesn't apply cleanly to that branch, send a
version for it.

Bruce

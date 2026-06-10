Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675FCCD98CF
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:28:34 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27940.1781116110296786572
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=moNI7gWw;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5176a2fd597so58658291cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781116109; x=1781720909; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9uRabp/VwI2qRn+A5sCm9mAe1iuGs/6ScBkFERUZs4=;
        b=moNI7gWw48yIcdq+iErIEJ8FkvR+a9JXjKw8PaFwbFOj82xImCHimUgLY8h1X4OxLI
         CK1nwWwUdBWRp4MFDqfMsKd54lN0ULsgLaMWXmZq6RaEMwnJz6UM6LV6LNMMbfTIvgxe
         jePx2/kxn8T5mXltoxeRzsG9T/XRHozT+srv5NNuir/JoJNimcZxqMdhDx2laurk6YCW
         G0hiCmLUqUVeD9AOqf15LeWPJD03dPkF7AvVVqD50uZOaVmGqIV1YpOFTCmai7RHP3ET
         98U5HiCXHdkW+5nWJCtr1levpM4PJFi6maB7PFQoNlhAbKtc6HWitQlYCnpsE0rjwBQI
         utqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781116109; x=1781720909;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9uRabp/VwI2qRn+A5sCm9mAe1iuGs/6ScBkFERUZs4=;
        b=i1TH5DBlARI/Bhkj17KbQ7ENl6PnHr2Yb638qXRjD2Zo5DEU6loYmfkVeCGWiZ+xFg
         G0E+O8aOdAdfITE9VPhKVAFWrhjAAXfbwlPOmE7rkiwG0wCUgm0nKf26+Xjr4SH7i6xp
         04tNw6zSPHSHGaFNFjZ5kA9Cv7jjC7uJv3DYnoZExcXZfMOulXwU6b4L2ByFhMjG3KMN
         920CWA5Pz+EUhlpLkLvYQSAG6JQsjvnxzzZWvcrCwh1olNPOP39/vNsKJHQIln4VuBaV
         qYjBVnuYgJ7htC0ZFXOk2H+9xwUfFWNSvAxSsq1px07BqvQvLaaEIfXcyRRiTLgek0WJ
         8kBA==
X-Gm-Message-State: AOJu0Ywj5ctcQRXKSdp0uxMaJywmC05gYdbr7rmIS73VGv0JpiEbt+eC
	0O+awzkZ2sKTGjtMq4sOICNkFJmjD12rnPKVGUV2N498NdIcP26gnxMZXSD841H/
X-Gm-Gg: Acq92OFilhhjrBgLEsPjGynns3Q4ot/Ma3zfiL9Mlv8m09KotKZBhDcN8yD3/jqFu2f
	DaviWh/6SK1gx0KJahf9VYjUYnYl0z5BsLqDu7uqbqhbMCLBwUFIhcFMi2UxATlHPMUdOK9zmQu
	W3KQWD786i5I9ZdKNduq3JxIlDjMbfcnWN37auwNOfdcl7wmV8jME+UB2PlPfLRuOqE6WeYjdUz
	VrBIqYbrG4Iwuvth2JagtaY16b5B6l/80GRPOOqzwnkLTiOe84o3RdmSY0Xscm79byC8Ym/pkwc
	SLWTZqNBzLh37lIqJtT5ONI6tK7CuTGlQW8ZQc5USBbcITDPeIlGM5uadAR91AjiM9Kdfm17aoU
	Nq45mPhbrqXS+gGPGA5gRB08YtDAj/bISCTJpLQZMP8yKjDhxuCjTLMSNyWao08fwLWDNrZ7zaV
	gniIX+CGopEZ7DwKGcPrmBznGXlgcJn2tZ00a7XTuJVyEETl8yWxdJkgHIdqWV3O9ZIpQzRcJ5m
	FIO23ZAUIjrY41IippxbnKEIZ1oVETNvLl1Mv1+ATVeOUO/wqwVXddjHsUc9EK3jJGmHcNbKuGp
	aa3hGwIRLSoU5Stzov81WT5GkNTCEIuvZJ8=
X-Received: by 2002:a05:622a:4a13:b0:517:92a6:fcd5 with SMTP id d75a77b69052e-517ea76295cmr8083861cf.18.1781116109321;
        Wed, 10 Jun 2026 11:28:29 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fa53sm241177666d6.8.2026.06.10.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:28:28 -0700 (PDT)
Message-ID: <6a29accc.cd6540d5.1197ab.cfe8@mx.google.com>
Date: Wed, 10 Jun 2026 11:28:28 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: massimiliano.minella@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, massimiliano.minella@se.com
Subject: 
 Re: [scarthgap][PATCH] libvirt: fix python3 compatibility in hook_support.py
In-Reply-To: 
 <20260603-backport_fix_libvirt_hook_script-v1-1-81e73d7e2d94@se.com>
References: 
 <20260603-backport_fix_libvirt_hook_script-v1-1-81e73d7e2d94@se.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9863

Merged into scarthgap as 9d0007a3.

Thanks for picking up the master backport.

Bruce


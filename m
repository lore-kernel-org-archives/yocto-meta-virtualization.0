Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.254.1795797673297080680
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 08:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=hmoFD4PD;
 spf=pass (domain: baylibre.com, ip: 209.85.221.179, mailfrom: rnunez@baylibre.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eadef147ffso6423505e0c.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Nov 2026 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795797672; x=1796402472; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=70et6YCAszecF7q9vC5x0d+I2dZqoxCH1SkXzqN7/CE=;
        b=hmoFD4PDyZb+Sl8z6ZmCdiHForyDgMUTTzhRGt6M2IRAGjlw+Z4pRNL1hqu23Du0h6
         i/MkGLF/r7KH0q3lQB29YWH9Vc8R/eDdhJXVvy6cK3ecb791LZ2SuYRsChH8KKyjozav
         9sgsQzB17NuTpbv4K6M67d98z9qktZXGNchC2xS3ZWU4f3BrLMeFqwCY3wbGYqOlZHbX
         rQddzft6ylRqB/Ca1nxbXp/hMpltTV+hTzz3pwirJMwyQpMehYw+LWrrIMRKL5bt/ZDz
         LuzoGjraXMbFnBqvlNQNLF/rZ9l/Krz/5ohgZM9QhRL5kSJy2cfeUeHbEJtRBQ2zOxYR
         ZTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797672; x=1796402472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70et6YCAszecF7q9vC5x0d+I2dZqoxCH1SkXzqN7/CE=;
        b=B8I0buTIKuStzBLM4qPZlu9HRg6MjUXmmZmPHEJlT/hXbPWsiESXJURkeJSzzsiU1c
         OknYP/TvRYnb4YEsuSoJEWulYEGYQEkNYpUM+cN4miLRu2uTakFdUNzwXPdwwObT6mXw
         kzxh7MuCxsixXlUUFOCdJE9MVDbcCn2h5HD2ooMYWMzkHvoq0eAXZO7yrFrImE7i8o6x
         GsdB5x8Hzpz5D7nGEMVR5xwUN0vQbkZFjh8HZ6nnsd4vnh1rGY+nORZ5rnb4QZfbxVqn
         HTMvXJB82AuCh12zSE9ryfCAJ2Purapw2CNg9YIkpHHEY66L02qrwjNanqgfMUI94su8
         JaaQ==
X-Gm-Message-State: APuU4Z8h8WeLSe6mmVTMCvcei04IJceJkLKhV3xScz+9oPWftVAl7/5W
	Ffd/VP0pNwbCeTzRT2EPypgbscoYV0zFwW7Fsb/G+XJClQJbRGR8cqjaTLXtLVETvCk=
X-Gm-Gg: AZFdTZeZhacqe3H1G97B55c/oZXMa6oaJCznLOOO1W2CBTk1gME6A0PQu/MgiRNBq7B
	TT+IBw/0tElc6HuoxqOWSopCNUnmAhV0DbbBG24PTzYy4Dt14kWb/F47wKrRnqk4Zv3lJsKwfpv
	6nPcCHBRBrljYsSSg6c+IZ7m+JVFDAmzfox4XCL9sS1tZNWqvJP0aBw7c80aaYa/akv/nB7J29l
	eBbTleKj2p5onus6M80zCDOHJRUEKmFKJpABrB11YR9y33Pmh27HOmv+jLFLC+w0t53WE9Hk9oy
	PRP5xNfS19iL1NcX2A4vdguZXc0rYC4FPNbmpLgHBR8MbG32qV9Gj+Eg9zXnkzKW6hKp8D/0KCG
	7ABdzOOsa3m7PIwbHb25fdwVusdq4fHwsrD8KjPRqLXiP+TXa/iRV3gdDZP7xaFvXAuS93n66wM
	5NtMULdyxnueiuxwfHIn7E8Lx1oRksqtgy7+4bXeLM1lui/KLxJojQHBHi2pr9RMvO82N2UNRwE
	jGQH6e38D6aElJOCjPr+7PHkaqsItgHwO9dmfSTE9myV/6Lso50WSIvMvYvXeOmP4ugazgnkMMm
	VA1cvROqA2qXtCTer5am
X-Received: by 2002:a05:6122:e1aa:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee8af38c92mr15484249e0c.9.1795797672173;
        Fri, 27 Nov 2026 08:41:12 -0800 (PST)
Return-Path: <rnunez@baylibre.com>
Received: from acer-e1 ([2804:7f0:7543:e525:5471:ddc9:4fc9:4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5cd7c8sm24614210e0c.11.2026.11.27.08.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:11 -0800 (PST)
Date: Fri, 27 Nov 2026 13:41:08 -0300
From: Ronaldo Nunez <rnunez@baylibre.com>
To: Hiago De Franco <hfranco@baylibre.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] xen: add initial riscv64 support
Message-ID: <awmypJhHn7eUb_D-@acer-e1>
References: <20261126131035.73287-1-hfranco@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126131035.73287-1-hfranco@baylibre.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Nov 2026 16:41:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10193

Hi,

I've applied this on top of master branch (commit 89b00d096a432000766729cd721ae647af500112),
buit it with 'bitbake xen' and then tested generated xen binary on QEMU in dom0less mode (no domU).
The system booted and reached "(XEN) All set up" as expected.

On Thu, Nov 26, 2026 at 10:10:35AM -0300, Hiago De Franco wrote:
> Add riscv64 to the Xen architecture mapping and allow the Xen hypervisor
> recipe to build for it.
> 
> Xen sets its own -march and -mabi flags for RISC-V, so clear TUNE_CCARGS
> for riscv64 in the same way as is already done for aarch64.
> 
> The Xen tools do not support riscv64 yet, so skip the xen-tools deploy
> dependencies on that architecture.
> 
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>

Tested-by: Ronaldo Nunez <rnunez@baylibre.com>

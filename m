Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6796.1792696152147896874
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G2oC6kFO;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f259cdc86so8442985a.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696151; x=1793300951; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=G2oC6kFOJK906fVJ5HaBdKtJJgkG6+/m9+LVLSjn32wqCFslGFK4QkfzdZMqmlv5Xw
         3VNFEI00ZOG17aC/Pggn1/Rdv9/QayMRw0eZjZp7t6zJPfebt5tzJNJ5PPHi9NTGMqg6
         s8wUPllsX/jULKwCyIkyVSN/UfbeSeSxguUH/TVpFdPIYpHA9mwiH0newng1Ltn3dziJ
         w1nh6l/W0J7XoGxcBtMjs0o37++h2w1oq0ZSzU1/FxcVDd+aDa2BKw9ExZK7Y+6xVMjy
         jzWQEX+HdyJer2BpCjtcJWEjsAlUbMiXkSw8HH+kx8z/MQjyNKzfR/EVxhsp1OlBPXi6
         1NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696151; x=1793300951;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=tvEDTI5AeCgVeoBg+TlMnLYljDFmnXGBwivu8R5C60lL3k7Y+L6igy9TM35wNt2qzF
         Y+gOvRHG4iNFfyThkPtvDQx/P8j40z2EMLFApHMqqItBaq67YwlyLPuYjmwhDZGPW0pW
         yS/m4GriL2AQo8HzqBK9JRT6M6u2pdYnXnsqQCvWO7dQep6adq0NkZUV1SvyDViuiSEG
         Nb8hMcchpa1NgzUGwGU/DrzUOLe8f1L7NfYSP4eDgI74kq3+ShRaCZt0ceat2X9cFszM
         +C5N3jDWAkISL5MSbHsw8wb0XboMl9dC+7vq1uzGWqrvWXc5piol9EeZ8mIRz4bG+kg9
         p1qQ==
X-Gm-Message-State: AFq9FYIo7AZ5CUkVF7Emz0+uOiqbp9sr3YO932kkhTu0TcnWX9wdFQ3Y
	nZ041IeTBG7itTX3ncafvvPiRIWl7RIOBgPp5DjGuGkzrEWYXfrIejK0rZMesQ7j
X-Gm-Gg: AYBFou1dXPr0BkGqjpLduq1Zo43BJIfg/CTaOLO/uDKZaemp+AN/Ofv5j0VZDT7Aam9
	20l3CbbdpB0JChR51IqiqjlyRu60Ct5w4DFEWxf8c0bhAvn6c8lVKkCqx5LLJpuTzn4abeUr8N1
	fIGT80w2EaKZ+wRwv2eKQ4xvWwr6sCPrDeD3zrOu44ix4DSPaa9H3NUBhw/2FXlp+MqsYbDI+e+
	EEA8DyTx8HPsttVls0J59vTDYaPzv8C5fRcFFVdEMagX4enFzTcRHD8Kq1gay1cTGSRsDRzhz2t
	Ogqw8s4Za2lEUeK9KYlBA7iQJruyelC/l1MVGKXz97hIyiAJY5W0kYnpMEo89vrb8+sqQXHIya9
	YscjPaJTMOZ1NG82xf/XLv3iXdFrx5C+IDic/u1PvD/0F29LHCdNY25CQUg2d9j5w5EzrZBM6ir
	7ESr0OGRfrMi/jHtg7Kvl4i55eLmdagO7otQ7k2ReLo1A5mGUfrjF7cNvSUHZlMpePWFhsYKLug
	aS3PTD+PT1QZYgmqCPel3WndF0A/xRItUZ2nguTI7QB9rlBxz02Msm5uEpo7pCusptS7GSV1Mj7
	/vxxV7q+NC02yoE2VS6Yxb76Qlz06Ku7F6drqGGiIQ+cN9Cprl/rf77sqQnyJC5CyMJLjmejYza
	Ol0fBeiTMRuCsIDps56n6uk591wQSF90vvi1wHFbDTYLDhZQRpwgp
X-Received: by 2002:a05:620a:8089:b0:93c:8544:6ad8 with SMTP id af79cd13be357-93f6f7871a1mr78170985a.28.1792696150835;
        Thu, 22 Oct 2026 12:09:10 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fbc2b8dsm25357085a.23.2026.10.22.12.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:09:09 -0700 (PDT)
Message-ID: <6ada5f55.6e3f852a.192c9f.5c68@mx.google.com>
Date: Thu, 22 Oct 2026 12:09:09 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: deeratho@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 1/5] containerd: Fix CVE-2026-50195
In-Reply-To: <20261016100641.1628059-1-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:09:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10126

merged

Bruce

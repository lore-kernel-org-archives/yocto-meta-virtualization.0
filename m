Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6784.1792696158895058365
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gtVCXGQt;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5364648ae07so632271cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696158; x=1793300958; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=gtVCXGQtcc2kaOcZ1DJfa2yjCMv/FyGqwjAWpG8/90eMcuWEehHo0ZW/Ih+e07/D1O
         Hl1hoPVLSWYd8vDaAZKgDf29F5n6xKn3Nensfv/OZOn9TqZYfZ/9IxjL4oyyz2aERs0+
         IrqgiUDEAVvKuUimehfYOQSOu12iFzZTKKZHb/q/rzw9upRogYeaOsfOZe//eg5RFV8L
         TqFrbCVhfgYQhCJyCLOzR3gp7jZwb9g0AzSmUDhF6KkBOdN+OsjCS0duV+bEzJUGnU2D
         ahnk7fatZLT9QE68APXLQxlUXKcG84cJSdBXMny9s8Ge70puWopSKs+BQDMlXtnpS7Ul
         lYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696158; x=1793300958;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=fAJ01Ls8Kfy7E4fcGXFTjqthKau7H83gLuGasQ4Sqz6MixMVR4mkV5INQ+AjWoFPHx
         03kNv45Mke+Ygr9zCmDFSBoKq3IE2Xb9OZ33bpfvi4KQ2tkYuiRDRtFl6ksjvWIR6DNt
         9sMwsyF8TjFOi6SsbVle1u3in9jOKRGws765zC01aigtcS03ajAFYMRC5J/U5yeHf7AS
         VOHDS/OGtwbORLQU9ShB/+gNm/vIu4e97HkBNpMjTwWHXsiXAEa+5XszwWDJNi61a+Am
         S74D4gTwVW2q91p/G1XFpBPup2KWO3gfDShzhJhrXfLxlYC90K4xfzLBg+WHBOK1s2DC
         afEA==
X-Gm-Message-State: AFq9FYKhT1oRb8QZdXBg305S7qHbWLMDURHboz2iRqg9RBv1GLB1o8MC
	/hcdJr9e4+2Z7kgcZdB5n0KtbXBtgpCPB8DSDYCMyOj7qdZ2aVZlEnkwyTyZycEX
X-Gm-Gg: AYBFou0jQVMIOfk2RTwX8k5PDqCmuAJ5Hw+gDIUEikMnOZsKFvnVNOOcpmD/ImgSZmm
	q3NO0wNp6uqbXhj+FyC3foVRK2xyyrAYVpZVjTQs7tRCo6tTtTNH8LlFJfLbMtLzEb6CWToCyyq
	htxv0hwFIy7EPksITWgOpEuz0K3MZ76fN7cjlHjOqAVu7FskzFoSFED5P3UyKQZ9n9jogY12q5N
	R7kBxoCSxszsVRzjShOQyNG9gtPfnArjDnlEQitu3P00Yj+ut4OiiXo5AXwx4T2wc6KbN9sKJPn
	FclTkHqi4DWCeYu6YkhiECf65Jd3h8ISaalcOmTb21eIvY69z80ZP+JkSazAr2Wx5KBisgz2z2w
	qKR/2eYdtFZBi2ddrnS8H54X/zv8bYJSEVBFfecFoIsVF0b8IBtJExL9eZTLPp2Wpj23I6TtcSP
	VqKmOjaMxTCdHadR1h5vFBYL5KfwE3doPQO/hHjOOC3B5Uy9fIg4AF+4MxuGk1xlPgMnQxAUSUV
	/fcvBMhq0KewSLtnYQUrtXN8Bk17bVcB/2k7zOwOjxEfhlg5aiFIFxNdZaqulvT9xYeoT8sVqFy
	7H7H1RijaZ2xJnmLP4fLXWVUpkpQsSWXMpDirYwMM4G5kMjWoh43gw0BXkxLA6nBhIFP4Lr4S9f
	cJmQIa8Hw9ufKufyLGu7eGFUDd2YYdMBbh0bxlutmh2c4ZGNbizER
X-Received: by 2002:ac8:5d56:0:b0:532:b438:1020 with SMTP id d75a77b69052e-5369b811cf4mr105362481cf.31.1792696157706;
        Thu, 22 Oct 2026 12:09:17 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab99bd8esm33178411cf.28.2026.10.22.12.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:09:16 -0700 (PDT)
Message-ID: <6ada5f5c.bf668b44.1d0b79.d248@mx.google.com>
Date: Thu, 22 Oct 2026 12:09:16 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: deeratho@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 4/5] containerd: Fix CVE-2026-53495
In-Reply-To: <20261016100641.1628059-4-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
 <20261016100641.1628059-4-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10129

merged

Bruce

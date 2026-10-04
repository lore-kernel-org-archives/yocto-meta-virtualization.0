Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B281CA5FE6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 14:23:30 +0000 (UTC)
Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23809.1791123802231474550
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Oct 2026 07:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KWFNxO43;
 spf=pass (domain: gmail.com, ip: 74.125.230.168, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917b200d49bso18572796d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Oct 2026 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791123801; x=1791728601; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5nsoFqLXGZP1Grbiy1UPDD4eNJJufi8WXeOrMcuUoa4=;
        b=KWFNxO438gyM6mDLMrvEpQR+BjubrVov/K62seLAhgsJtE3Am30XL4Ppk9lBel/wfS
         Axo/KPt9v6QAqSRMa2FThWR9YZZY6J9hke0aARPcq7PawJvZRj/vzZNUhOo5K6E6J7+3
         riXjoF+YdVkuTbSVJbk5KHLZ1HiWesVgrNNf5kAjDeKJoJ8FJMs4Xs6s+FduGTQrp7FZ
         tOGdAQVAMhbW8AiYUMrSJx/0gDRrSE30egYNtVrfbQs8r1eWH+rEOSH3nqrt4iYTElrW
         +0MB5i0dJP/dAMQBkw+Dr4Ud8GJ+GPUO5i8sGPdcvQrH6QVSowxZX1X3X31OTcJQpHN5
         SPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791123801; x=1791728601;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nsoFqLXGZP1Grbiy1UPDD4eNJJufi8WXeOrMcuUoa4=;
        b=ylWwNx7E0w5rGYIcMkChKzNPzuEpnhkmDl4USyHPUjQzv3GvW7TOlJOYrbSX4902p4
         eJNl96cMNK0li4uR3DMWjQJHH8IAbCtC030qcQLR45lTl2Zf12UHGNTLp9fTVx1/Vufu
         VJ8NIzmL1sJ5ankMDhxP1k7QTDo4Ia7tT99SJCJClUXb9yX6/661gdQUNf/FCGmp2W6x
         VJjBiFZYvBXe9x5+LLXRbValh4hvyN7HhFHQjcI5nqU3ikWxQfPeFv1CKTgcHyFhOUnc
         gkb67BNwifXiFNTpn17KXvGLMLk+JHXiB6elXnqdXmiNy9kSyEnoYZ1esHFDr7W3VRAR
         VTtg==
X-Gm-Message-State: AFuF++mlW2IvEb3Lcvnks0axefbk4urW2PFa+CgcYrarukjErFy/O3Y3
	3lgLL7BjH2suOL0ZwTeli3J49jG5dxR85WIvc4CtdHD0QYYmH6KzNpfUSlgZE32b8roAyA==
X-Gm-Gg: AYBFou028a1yZP+N8VQxlNJaBy0+VVmeRG69eF7+1sggftvZnllP2hQqimpkkKK954e
	MHgE/aQezeMg5MFScYB6ltoHeBNChfBctIvZek52HH8BFIZWueqxSDTKUXv95SPT2h5fcrIkYUG
	V3XK/R10qRgLxI3UL6EEL2VcLT3jl2sdIfROF/OlzrNSdEDqyygxC8zfnTaXVIH8jV9osrWfsQs
	C5Mu5UktUQXtcrYHH8UxjFH0MXeccWSuT2rAFUu7Xgh733aa7aRplrv/X6nLrWrscRV2HtmbT9M
	EiA3ERU9HZ73CulLEmA6zBi3qpQR/Zmk9sfB1KD7lO/ZQld2NZdpwn3k0qQzoySJ8WuQ3TjVqiI
	mkpVamavJ3J3pWLZ7qE2XXxt5WerWQflX5NTiLAozbr/kx/RghDo6v78Pva/Wg6P+kO10H3hCoW
	IfVtlU4l1S8GaM/4nTK5lctZcf0iEJHNB8IvVUwPSv4ohCvYmnugfO6aNi5TjH5gC6q/2LZFBxu
	Q2tE3y26/YKEbovgaihmQUq4wRR/T1hLmLkeIc5gccvVDScoy/FhRlxyV5Ml+090kdn6QfaWY+s
	KwLOxWHXRpPKZ9m9bfT0nORC8mmx7a5Mey8QwuWv2gdZwLbxEKKg2XLANVSZTq7iplLy9Q4=
X-Received: by 2002:a05:6214:2405:b0:917:96ea:f2fb with SMTP id 6a1803df08f44-917bff25304mr167620616d6.3.1791123801051;
        Sun, 04 Oct 2026 07:23:21 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c3c2a2sm65356416d6.47.2026.10.04.07.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:23:20 -0700 (PDT)
Message-ID: <6ac26158.a0d97ae1.1ad4f0.9794@mx.google.com>
Date: Sun, 04 Oct 2026 07:23:20 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: peter.marko@siemens.com
Subject: 
 Re: [meta-virtualization][scarthgap][PATCH] crun: patch CVE-2026-88264
In-Reply-To: =?utf-8?q?=3CAS8PR10MB507396718D6370006BA98C5AFD972=40AS8PR10MB?=
 =?utf-8?q?5073=2EEURPRD10=2EPROD=2EOUTLOOK=2ECOM=3E?=
References: <20260928211145.679470-1-peter.marko@siemens.com>
 <6ac1ad40.5fb20c3f.19ad37.fbd7@mx.google.com> =?utf-8?q?=3CAS8PR10MB5073967?=
 =?utf-8?q?18D6370006BA98C5AFD972=40AS8PR10MB5073=2EEURPRD10=2EPROD=2EOUTLOO?=
 =?utf-8?q?K=2ECOM=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Oct 2026 14:23:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10106

merged -- apologies for missing the wrynose counterpart in the earlier triage.

Bruce


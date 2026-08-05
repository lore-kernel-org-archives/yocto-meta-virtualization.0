Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92837C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:51:01 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6674.1785966658245718448
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 14:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CoLwzju6;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c2808dbc3so9873441cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 14:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785966657; x=1786571457; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=CoLwzju64NbfHDSP3h4fJm2DT0qAu1I3TWXl5Vhpw0Rd1fY2ajoAXb2fCYkW6b1MF0
         /1oI1pHc5OaDc7jWu0/6oyhHaOO1H8e+0ZGvhcah6wo/Kiluq2cm278xcezA/KYEmutg
         YvdAy+zEAt2LNR4pvb5vdstKEPsU3qvNQw07z9jkLP456uJ+iNdPzYBLcAiwdAXmYggN
         OH7/PEYdHXTeS/RpcdNnKwVMmR3oue/j9RJj0Er/jKNfqte8LJNjsRnuw7yHycdHySfk
         HZ9TAMxGm7oPZ6rG48XTqHWICQR37rL9LzOGPuYY2aQevvBjf0Brj/VQ59fTKKwfpzRu
         6pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785966657; x=1786571457;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=WwATsFWabaIaFgR/P8owYDv13R12K9Smp2xjCYnN4orz8ywjytQz+xoNeIwkM+VE58
         IYKADR5DL3UeR6WNuk5qyxUxj3KbFOLW6W8tI+gRCtYnNlVlxoQ5pCoxF4/toyCYQx7o
         JS12Ukp2J0FOBFIryL/GxxpZN8wClCTYaDFl109FZFn6gFXFdn8I2Ec6UNeIqdzXrBgZ
         IXL40aYcTzhe5jJ5V9psnYyxousFCb8xuU07rMsKwdyUnbwyOeLQheEp9+fpk2LvAEo4
         C9cpT5FRnJ6jwCDitNTjqHRlEq6V6OCfEjfw3tMCduFpP0PYQM+ohS+Succ0Y8D+OX9d
         xbfQ==
X-Gm-Message-State: AOJu0YznLjmSV0SD2U17MAIJqJVvOej1s8khmaPIc4r5cxQva017kkfr
	Z37wRaLnRbjK+xwlSQP/MYvnJIUM5vvG2KcuttpoY0kHQUH+Fr4qrBHV9zAwfiDx
X-Gm-Gg: AR+sD12nXDNTkIKaq+sOrotuLaKY5mQqtMe7ZxG8ynF2gh4J3wuOhFgt7mp2BfQ8ZIi
	WbvB6LEdJXOqAFj6DpOfwpSykja2XsaGRQpUKgZ3DhHYlLF1gkoo/NhyhvnjFzhIihfW1m9fXsT
	SNBeMjlZm6ApvORx3Ep+OiQUJPhku1mwf1s9bwEzbT5qMpv9kEEYa+g2YDh/XO5v/88kz2et1tX
	EPeoO2QZl7RMUsLNkQ/3YFtnFeMhBUpmLUjW7PtuNd1459yaTCbPMcNXxhNzt76rODyCDElDuBX
	F+e+nhf2EXJ0ZZSIBKmQ3RSPgBelyYWquB4lZlWQx1Sdp9QQUBAAbNplOr9+9xMX1E36Ey2SuBI
	kDYIAsopI2V+oh6hiXqJNswvMtez29Y0/q1kYaI9+uk15KVsui+Zlihu7AZKXp8R4PZtP+8vU9q
	4Cr7gX96pJSa8i0UBnRdgxGWIkGRYcvGsPA9/WmhJA5MsqYNYfqk8vLwpPxxkVxWWkFRrPWPfo6
	lqPohMSlgOew8rQ+qggdhrOsmhjJiaonNKt7HpZ9QjXTYoiIh2XNIQSsGQgncvESJMIgFEmHGLp
	klA2NWI13+CGafN+g4WXaZVl4SLMOKPVaxdL0eFNQTFAdTsc48a5p4seqEocig==
X-Received: by 2002:a05:622a:230c:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52ce61081afmr119837561cf.28.1785966656969;
        Wed, 05 Aug 2026 14:50:56 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce87d2f6bsm28885111cf.10.2026.08.05.14.50.55
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:50:56 -0700 (PDT)
Message-ID: <6a73b040.403c09ca.3ef41.7cc7@mx.google.com>
Date: Wed, 05 Aug 2026 14:50:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH] crun: set status for CVE-2025-24965
In-Reply-To: <20260728193602.18644-1-peter.marko@siemens.com>
References: <20260728193602.18644-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 21:51:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10022

merged

Bruce


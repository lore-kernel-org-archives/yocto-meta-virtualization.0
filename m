Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0CFCA5FED
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 01:35:02 +0000 (UTC)
Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16616.1791077700716433110
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Oct 2026 18:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qpP0r/7E;
 spf=pass (domain: gmail.com, ip: 74.125.230.233, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-534af4d1a37so6009931cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Oct 2026 18:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791077700; x=1791682500; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=qpP0r/7EiY0nLLNDkQSiyZc5LOh2EglYsfJ+Hz6xAuM61/baNjo5YW8MFF2txPsxnB
         ulYFC1NJXGntWedT32rai+qVEBP9m/VioZNaeh1PvqrDPLWGOWSYWWxOXE2Cc0ehzrb7
         mLfpbu/TKO/MgFTX3myitbu1yyaNzzTI319KQZVnwg2uOScVEPrMMS0Kzb7OKwfJTc2n
         FI2r2RJymVPNuOVJsSj85wlgiIqoTHBueOtqB4dx6DZFMkQr2/4RChbFq1fcrCOde8XT
         50Tqf1KkEaeZJtQLD0ZeQz/Az8qPaQsB6CadxoIoFGjc48oGwfAZhPewpJRL6ucHJ641
         5K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791077700; x=1791682500;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=DihJb1MdJ5KCu/DG5CMGjT8w1mU2375B1TZAlQComDgW5w3Pvl30+S4CUqJJrW2cOW
         W5rycm7L77Frc8XMWfJiZGOaPFYHveKngOBGXHMKQ7uYQrDbjiSzJPFLPvc5ji08AGb4
         A6MOYuLV1EKBZo188zpdV1qjq3y8Axh9VvdtD4dhYygDuK/UvbI6PYDJi8W03Z832ylG
         AX7rw9XWuRlyfybQnnSSIff6RrEUc5p0sQm8s2yY2jJgjm5X73lT4CRZsDA89+ucXeE/
         ZP4DIQUZ3BrL6MXnMTOHzS/xmvmca6aIokYwNMJx7pqRwJ9LV0XFbhwuB1inMdidrcpr
         Kmng==
X-Gm-Message-State: AFuF++mATAnCAZucmfKG0xxb+VVtxxdXvW03d/KjgTjHwPepW1fT3IvL
	SJ29SJO20RNwGyzxuJHA5p/ahPedMfcnzaV3sYtbrHbZSJDdqSCkT87fjz9/6DCnqQtIXw==
X-Gm-Gg: AYBFou19XHIO9GJ11P9FHnpZHEhXWzWbAHRqQZNi+MIXV8RqkCZPt8JEcD57UMSSPTH
	G25RkCt/xPjWUznux1ZLzmTX1++oD1rLhir+9engW0VVtm6n/XkwZHqwJDNvQb/UqclOtrqPhuH
	k3HrTKcm7nyrxv5MQICfInnilMyQyMQ8aqH0NCO0h8SXa1cjKS9n7VjBg+jrYCWaSzt680JxJ7Q
	Owd3EQEJQdm8hSaFRjP8Crpufn8cUSYZQO8iSA5WiXP+yFrJXxcpzxjVvmGafhLWqmvL9bIIyEv
	Yj0GdvmWy4Wbfsb5WJcN8DPa/PKCfubJV5MGQBXivAC1ujBvdOuIjFohuyImLbhFMY6kXnkNanm
	Gi1ojh8Tf5T2HyLSYgbY4RsmU18ZoGPHRjEMwin7ZTSZtbqe4y1oYBVa0rhoXDUi4Yl47tVSqoQ
	sDGmqXKIkrFlWwGpqI1hV/IUCH9JXbTNchSt4HziXaJseOxC5p6AUb62UhpO6X6Qa5KV2vlN0vw
	Mxd7/kMgTTQ3T+BFtppC0R/dQmPnUhLPRadftXPDQYK+eja88JPM30I74kV/8cof7STOcISakM7
	wzdJbXMoIAQucL1IRU2I3FCGTC7E0In5zEmaBrgi32lXKLq86+n+YjohCKIkLl0lWLZOJT2B
X-Received: by 2002:a05:622a:5d3:b0:531:1e27:90fd with SMTP id d75a77b69052e-53513d09252mr60315351cf.30.1791077699567;
        Sat, 03 Oct 2026 18:34:59 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a5b6ffsm62867511cf.6.2026.10.03.18.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 18:34:58 -0700 (PDT)
Message-ID: <6ac1ad42.b7d948ac.325795.7549@mx.google.com>
Date: Sat, 03 Oct 2026 18:34:58 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: harish.kore@windriver.com
Subject: Re: [meta-virtualization][wrynose][PATCH] podman: make manpages
 optional via PACKAGECONFIG
In-Reply-To: <20261001220548.3270639-1-harish.kore@windriver.com>
References: <20261001220548.3270639-1-harish.kore@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Oct 2026 01:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10103

merged

Bruce


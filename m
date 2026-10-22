Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6781.1792696153889757183
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fdxPE+EK;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b834592afso2554796d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696153; x=1793300953; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=fdxPE+EKtKVPrPf0DE9YGRzCMu8zU658ubLfR+h7h27m2fVxYRVTpp1L+RQ6G1AvJL
         IW3xBM66OiQQoYMTla2TdmWsEw1bRBzcwBLFuKbsBNO4k4l9kGbZj7hBE+deZVq/prBM
         XEsDGoakLTr7LA51RMv2TLHfklIWbJhZktxX5jUs1qBxQFgyheZbb8tjmRj6Fx6gWtQM
         sWt4Aun8rcSMcXRRtRYdM+2Ki53nF6imjzGjLrlZqEjbpJVCd1jPswAYCdfXZ7j0kM6b
         qz0AnPnkp+vw42do1Shzhg+Qq/p1+vjqFREH8o4UxRwpWt0ZmfT9CXLftRTpUmUgOTY2
         7NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696153; x=1793300953;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=LqaO/8U7+QAplu2HkvkD1hmoHr4SCWLHx2jQ3hJYDiAH2GaLwUBrypIX3yHaGcpvel
         coMlB+ojWsywBM+VRWPb1oF+1lPflGmU6XWTktCCrouL76eag6sVoLv1eU7nHO3BaYoM
         kHVh/RAN64QXsNIusAIWWMgyHV6zCaz799Ec33crajWXvGIglP+039M+84AXTx0AdLr0
         mQkG9iBfIkTkEjbUuaQF3VpJru/L0nsVi+Mt1qQb1TrCaZE70v8IzkFjHMOzBgr2ZKyt
         jp8Hde24lD8bMC/uIfPYGAIX4Wix/0c8FsVol7MSbzdhTD8qHh7LfXCPfubTtOaa/VBn
         3IQQ==
X-Gm-Message-State: AFq9FYJco1rEqu7NkmuYrckdOzzwSE8xokOi5fYhiHTC6NR6y/0uHteE
	fKq5/m+PnIk/fTd8Cwn2W3HclLdxBYCAw6Mzjm45eGHiXV2gbQZUTcW2O1cAt+Cb
X-Gm-Gg: AYBFou1iGqFWWQsEGKWDPCwldqoOmSLjBRouCP5Py+i1rgQkGtpXQsJH6SB3Tbp65PQ
	wtYgjymuXbQNZMhkiMpKfoMNTwPQlEVEm/Q5raj2qRWFuT38jl1z9WKbvc6G2grNVShiR9ZK4xN
	6p5tg80JsZmI4u5aXVRwWYmwjDlZ/Wf3QaeZudDF66Pm4ZnSPcodhno0fRRIqIbrsF8ja1i425D
	LuhT3HN4uI2a15OS81tPkoB0bKcAnYrnJQmzbQoTrhOlYLTJFwPem0eoSIOqp2/lbkwWpAlt2Ip
	vVzHtxlR7wxUJEarVn7zZLNm/r4xyktNeoIB3xklP8Mq2yDSXqEjY/KnJuj+wHXS+mICzSoYGfs
	yNFhL6dMSsv1dOoVlDEajM7inya0ed81WaSq5MJDPbCZQlTawV5Xt8eSHTXTR3cxNfVkSIBoqam
	eFveqtTrG23Gv2uKatCWyScOCPJ/Opi0Fd7wsjqRjLr/C/plX3uiY3xYopkRZx0ACTCToCu1tS4
	d6lKs98aLltbINf03NQhkO7bSLFm6nuwGTFfS1QssZkc2VM6aHkjFvTBJK78xLb8UIDJ9Roc1Qb
	ZdvHpRP0KOXI/4xSqHZOp26YlImq4LGOzmmzCTp83g7ZV1gLhgBGgh+fh7fELzC5q/KM8q9XqTW
	nlBjhSADyxzeytyYgNs5BgtlHPb7LGGQmA/Ylsi9GYYUEWc6FSIAqvw==
X-Received: by 2002:a05:6214:5a06:b0:91b:9352:15d0 with SMTP id 6a1803df08f44-91c12f18a1fmr107788636d6.35.1792696152562;
        Thu, 22 Oct 2026 12:09:12 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c370ad9e4sm4539516d6.33.2026.10.22.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:09:11 -0700 (PDT)
Message-ID: <6ada5f57.2b67b608.293d80.02c9@mx.google.com>
Date: Thu, 22 Oct 2026 12:09:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: deeratho@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 2/5] containerd: Fix CVE-2026-53492
In-Reply-To: <20261016100641.1628059-2-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
 <20261016100641.1628059-2-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:09:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10127

merged

Bruce

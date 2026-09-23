Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FDAC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:10:56 +0000 (UTC)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1552.1790179854295437868
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 09:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D+kM0ECF;
 spf=pass (domain: gmail.com, ip: 74.125.227.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c9031e714dso461334e0c.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179853; x=1790784653; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=D+kM0ECFSaxzOpfhX67IEShBvEOK8OjBzxz1TvsxliF7h6ZmKUxy7b7Tj2fp4AOU+Q
         MZvLD1Itl7HdYrtuOmVFMWu8ty9amWZaaCxc3ooyOEEYsmuKrFWnXtIl1+99disCKu61
         CuPJGR3GNU02ejfwVjhIfEnwspzqeTC3AbPzJeRdAFQrzGmSj+C7y49R1UIrfCADBX8f
         Y2XcG5lLlk7APsk6H/mmG5CZko29r6oo/yInSlMTojMa0okii7aXmt8BuxjBvhuUMJzu
         A0kyxTNJweBCcvxCXzEhf0j5wnrZ+POrtJxS1JyTNIl6NmUuw13Yfk4AUp0JZcz4NKhh
         0v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179853; x=1790784653;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=GnsjjIAq0QqE6SbSayWzrNIPbB9jPY6ZTmin5TXxlhTlta4RdCWZepVLhmJl3QAT3f
         xfwPJouMwvxHBMoISbto9sH/KPpm0sMad95PwpIHzfATFdO+Ziw05jgjy9sqT4v8yVJl
         oyslXau5cJpdgEufSycoxzHvd2F8A13d2XuIp0w9zU72Bo84u9B+0FHdq/jOo7FeXoZP
         lnad174B9HJf0+VGKmzinGMNA6TQlKYgW2G6SdBERBsT2VBvc3ZtvSy2Zns715hhR+aO
         YmeLi0mn5XfsQvR0Th6c46mh6HPwFxCZCUqA1SddOU9lcD6O/px18dPAaEimHUFQxi3p
         adog==
X-Gm-Message-State: AFuF++kOnpA1QjQChDi0QGvz+yay+jCHyt3lcUFJLzs8qoT+TxKIoy0L
	jUxxuCbRh7Fd9wxvY6xw6sHlVXlO7yYjbjEOOSHtfLeZJtwTkx8jylvS1z7FELJYzGg=
X-Gm-Gg: AYBFou0dF2ULCT4ezwPrWIuuw1NhwWSlsu/GS6JaLPwFFNQ4DBERRA2u/rgTaeyd/vA
	dLgUcvjbplgRP82MY4PBUTOV8LKU3IRqGxT2o8BqaghBphfEiH3yNxY8sOZ9zC0/ozCeD2Kpx2y
	6jFuDKUG76glqIfHkyv/aajnDzmkyswyUHbJUq8R1PhywsEEPWWC5xJkYt1SlA7PLW4p3Mf/mTY
	AjtCwJqE9Q/hYNFFZUR9TRlGjmXL0OFwgzEuoa8D6ABldKDJaYQJfYHkQn7N4Hy8PjktGcwKR8o
	Fe6gpSThsWXcrwRbQjyhN5XAfArm/vOpWuOrsAqDtR3uh6LRXbfUz0z+j3fxZxb/Mv0UOb3MDae
	PnoPgyYSkiREnuyopXuIe1R4IrMuR+ISZkvJzgQp3pW9Tj3r2wBkbGvED1yHsHiKAVS1FWDyrZD
	PfgjN7jkgXtnsGT0JUtcKIH1xcGWQpn7CzdtKpDoJd3LVCWhreh/Iis0RQQ6y6qEl0B8cobKtE9
	HVfCfqwE6u3RIzV1qK3+srU4zTECv23aKCb7QET1L2NNMLeuOAEYQz2iIWIQyCCNeNbordDvL+y
	v1HJ4p7UQHm3yf0EXWbelN3ZdbwknrPhPh1RS1x+gzcwhypVb+2isygzy+rE+2opTCihzsg=
X-Received: by 2002:a05:6122:3d49:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5c9f1632ebbmr3422338e0c.13.1790179852890;
        Wed, 23 Sep 2026 09:10:52 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm3784018e0c.18.2026.09.23.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:10:52 -0700 (PDT)
Message-ID: <6ab3fa0c.8876e3bd.2880e6.33f4@mx.google.com>
Date: Wed, 23 Sep 2026 09:10:52 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: kaloyan.rusev@elektrobit.com
Subject: Re: [meta-virtualization][PATCH] ankaios: update to v1.0.4
In-Reply-To: <20260917130408.860796-1-kaloyan.rusev@elektrobit.com>
References: <6aaaa0af.6d64ab45.378b8a.460a@mx.google.com>
 <20260917130408.860796-1-kaloyan.rusev@elektrobit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10094

merged

Bruce


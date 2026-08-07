Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A6EC2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 18:11:10 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48583.1786126263279234337
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 11:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OCDqAvwy;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92ed3993c1eso194193485a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786126262; x=1786731062; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=OCDqAvwym/pUZzuzKf6ISdDw2ucAZhuQt/jAhhd87BxFW9f9xTpaxiIsTgIuNhfjzJ
         XfMdEsFLeMHWFNfHyrfAXNPHqHtO5sDKC9Z2M0HmficCGfMDDkQvq7qbOl/Uh71emCky
         ZnLsWbXsfaR/pWMij7mvvtiglNRKOB+olVVVfs3ySH4P+J04OuuMBWDnyjEG93jqgzfF
         euObE3Rsr+Z27J/Gd3DJQLMbcu94lVDoV6iP+8o9Vv7kOdN99fncEzkUJYTx7RAekWEN
         CxwBrwTEoGfbC27fKtHLqJItOXffVyqd7MCaNv6S6hbIH787uy8XsSkfd1HAty575wzq
         R5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126262; x=1786731062;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=QLcJRfhkhUXsCM1eDMiTgqkAqHO+fk+rlV9QF3ycrFZgFBNDNjoaFfN4KsiivItRUb
         YqOLhyHQO1dHwAUtQQql96dicG1vNDSewnCMr953UH15ivdTRhyjspRLBvmst+RjIRzP
         BYzkTCLWBT+TtFiT4TDQcgmmlvMCVolQpCOPlJPklvvcD9wA67C4Jn/KGPbUHSgpZ0ZM
         Dzy1emVT4qs/9U1hI+ADTCTZQzUN/hZJOgeE652ryT/C1OWOrgSgmkCbgHm9a+no2dmY
         ysKr3wdiBP35KhMIyMaOpQC6W3O4x8w6GPPA0k55tqMbXEw65kaXv8Yjh2zidpt/d1LS
         vPqg==
X-Gm-Message-State: AOJu0YxwJCFuJlJAH5Zwl9liwGH/Gh3Bi3aDaID7gmGRO6NHN10h2arw
	62fpJfCDZOyDZjeGOzZ63kaztzBZFwF0VRZoTx3PbKjdkdYfETlix3CKrdvaAKq0
X-Gm-Gg: AR+sD104xhlILi+Ovf6MXExHaQ6N72p3f4b+y5Ps9XvIdYQkDwCEkA8EKIhWk+FeobV
	LG8qax0Xl0A4gRZoOn9riZtoavcslzvuwfmq6iUjVnTqGJEulxh/c4TZPOcN2FSk4HTRLdZMWzl
	oXeUoqNNkfaKxUuErN3veD+SIErK0FPCTw0byILNLCb/oYSf2ikudTxdKH9FjePLi5rMn/cQYHi
	x4gkR7PDnuXtKyzguJnPkcA8SlAAPzdxpidykjZUUDI4tRoigRwQyGgz32Am8ie7aA80R6kAP3t
	77JwyprWYTBD/kcPSXUgt/Vb6YaUSs7XyETpJ/BFEhVDGTKIlV4w7XNjUg6ex0hFGfIJVHA8mEY
	q2TNPyz1/nEKKNepl78E2eEb6CjivCeaXQZqzV2+pi55l8HL7rIDej+AxKOyp/Y1nRqL68hZ9M6
	0IuhMWrmpVoCf8l3NAbh9ry9T1FtAnQjXYsivg14gouNNTjo+XsVD8uR3YfK1RVJD2YxLllXp4v
	xuCYsgjmoCjTvk4E2ARsu+sCAqfCKAZQUjGCYYNAqcoEItuNril/yrbj9Urv1qNzaRMOPga5hJb
	ss8wbgvm3GOFlQX/4Y3ZTIf2JWFAfpBwE3JeHA+H/XgrokaBbz5Fzc6C1bVVfQ==
X-Received: by 2002:a05:620a:600a:b0:936:587d:338c with SMTP id af79cd13be357-93671f1bac6mr616994485a.37.1786126261968;
        Fri, 07 Aug 2026 11:11:01 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03bcafsm203458085a.1.2026.08.07.11.10.59
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:10:59 -0700 (PDT)
Message-ID: <6a761fb3.27211789.2d7fbb.83c9@mx.google.com>
Date: Fri, 07 Aug 2026 11:10:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH] python3-webob: update to 1.8.10
In-Reply-To: <20260806055355.3112059-1-dkelaiya@cisco.com>
References: <20260806055355.3112059-1-dkelaiya@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 18:11:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10038

merged

Bruce


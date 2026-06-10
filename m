Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C13CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:58:34 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28335.1781117907572283697
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ojgheS2A;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-91550dda53cso832720885a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781117906; x=1781722706; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCe+5tdOOqXd+2W+W9R4Ayegw7smDfAsoeaM0lwZnlI=;
        b=ojgheS2AiPG74unN8HloMXor8cl5/rVO43A03jUtTjV96sD/BjI4kZmKoe+cren2+p
         9PlK5bN8UT6Hepm52iJUdZho3GTRXELNx1glm1qX/TILfEuo+CXw85kyJNThJo4+1xLs
         aq0qLYAMK6iJvgiP6kVnwpR7nZkVJhkSyc3+5r5CUG70OX0eovq5ABlc9Bk4o4hUxat+
         OsdkYxkNkS/fZdlDUP8SCPitbdkz7iEZNXvkX+X2mEB8lBOX//pLtp0JQZ4fS/jCdK7D
         018VzYilJ2o9YBpxYQtk/91yjCWfElpD2H5BA40Pnh+flA1ZdrTNAInAq39czmJiLGph
         GuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781117906; x=1781722706;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCe+5tdOOqXd+2W+W9R4Ayegw7smDfAsoeaM0lwZnlI=;
        b=GxDBWPmyqOSZ5aadIefxKu8ZjXmnJLelORn2rDN4ZQn7DAhOJ7NXwp4yFGpD6KGDa7
         io94KnBYstocf3xjNr2KsS6LmjCpoCAzBCG1G/9OhWAUcL1p/vsrhECBdPteP91gopQN
         lfTEjm84KItmvM/tR7VDef3RE0LsLE/yDnhPq11Z4eeuZSQqkWtczP3sf1otzxuBrTMz
         K3ocOeX//ByBRPWDb1rsYCa0Gj/r7dv6SmngslbU9SmfA9wSWNMufWMCv1XHg9sIZPQ6
         AkIpZMwUtRw0mjG2EYwULN58N2UH1M9ixqploZwyQsETaS0nmJ+u58iIHKpDUgL69vsQ
         ilBg==
X-Gm-Message-State: AOJu0Yy7PMZKFU7/rG1jAkTeh4plbj2zVPpM7zSmJQC3p+M1v33dlGYl
	e78orepUWjj4krxtmThr6PV7pWKnX52ScDin4BYO8dXsM1e67dzHJ8EF
X-Gm-Gg: Acq92OFbqJid6VdwklzdrJOnnwvtjKqF+WOyN4g95mP4BMXJU9/FP67vuq9TMl+zdOv
	GkxPcP2vKj5miewyNgODhqxzPqZ4j3Dr466394135BlchysK654yQPNwBbbqRcZ1ayyWgTQ4IbB
	1v6bKLvVj3E9Wrk4+zt1BZbC6SEKYhV8gzs7rrfJqJecwp0JXNA7nUyiENawXpjonsenBHEe3d0
	WRgk0TSFd9vVNjJuf0tzj416a8fV+qL4d061e87N9lmHGT8Bk25hj1ZOhcHoAq79vnsw6EwDAhQ
	EOGdPJagi7/kymkH7H6C7Ns+Fls99SdVUWniSATahPLLUbV8FePvIOMj22NZWUR6P3TRifBxp89
	AODkFB4VHMIlJvroXN17UE3fZuS8rUo8Qwh62qJtI2W3qjUm+UA0lDftJYJI5gpjA31+Zb6iVek
	99ta7EUPH4gz7vOsZ+D3urUiX4DwmgvjqqSSbMeBfle02QKtckp0iMQcPjJAWZtcGdy5ISwWGsD
	vwJn1pSreDKv2LdYzsyyj8116nFlqo+1dTiRIRJyAPwcUOSuI2aQhmUioENSqNf4SsUMGG5aVE+
	krYCeI2RcYBcdfIZ/IrURQxDXtbzqZ6QTtk=
X-Received: by 2002:a05:620a:4141:b0:915:6cf9:5630 with SMTP id af79cd13be357-915a9d89fdamr4364473085a.34.1781117901792;
        Wed, 10 Jun 2026 11:58:21 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91589ea0bcfsm2528217185a.0.2026.06.10.11.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:58:21 -0700 (PDT)
Message-ID: <6a29b3cd.2224c765.ca7bf.91f4@mx.google.com>
Date: Wed, 10 Jun 2026 11:58:21 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: zhixiong.chi@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH] kubernetes: upgrade to 1.35.5
In-Reply-To: <20260525130349.3963929-1-zhixiong.chi@windriver.com>
References: <20260525130349.3963929-1-zhixiong.chi@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9868

Merged into wrynose as b240066a.

Thanks.

Bruce


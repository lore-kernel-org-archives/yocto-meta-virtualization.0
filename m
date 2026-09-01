Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B608C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 15:12:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10661.1788275536064544417
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 08:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KHvzhrrG;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c207cb16cf5so812770466b.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275534; x=1788880334; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=KHvzhrrGTCmBXcNOuSCdpHb6P7JaZIqct7BD9ywN1R04nB3v4Il+LKuAp7PsjrUTE9
         9T28cfxBMmkvB3jvS6PvY6oZgNahD90WzYcw6W+xMfaE4VW3OnDiqeodRQ0wbdoxyozG
         IG5jq6Kyl2oGMhGJuDaxO9zCW4qDc+7t2h7E1Wl1kCYM1jTpIP4EPM+S8jgWmGdBpXo8
         PVMfgu7AoZtSy4o057tFMRb0BBIdD48lXKvASnoxmSm6reGhPZf6pJASatMjATSl6mby
         f/7kQO3aygGIuYG+1i/XxgdC1HBF/miRhbJvEKxqENUu/zONmbNnEr2ikWpgHezbDSfK
         IdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275534; x=1788880334;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=oeBilQ71tmxzmft9E3ZN5kPPm18TAL310+VrAInbyW3F6vHusldx0ifiT5Lm5/iIG7
         ckXk6P48lCS4qfGS4Sr7Qoj2soHRGAlWnDQZYRV4xl0gYYkpOxg4wAx1ahLSZhXZSX44
         CtAlIloCkueHOh1LQYhnaxk8FENQaLhP0zS/DYLYirQGQYk2ZNSwoVwtRseij/RfnSVs
         ekXDixEmpOZbJEwabRJuXAoH6gCBlIIghEV4xx1m6nbH2KkBjJ04iSVoCqOEh/wTi4+o
         FtdeyBqJJCKgeAy9RfkKhXE6ldv8Vy6rAbe0bn+TBz4Pg6Z9m8IUIhsOire78r3ubQHK
         TxOw==
X-Gm-Message-State: AFuF++nxD8M/59XYHDHex4otR9rBXhbO6G+AcMHchLLy9exTTBdnCjM8
	yRh0wFEO+LceIVeUtPE6TRf0m/DKR5ii8tF/8LoMdnWwFzzDNjPhfiF8
X-Gm-Gg: AR+sD13ty+aA6caqssKzIXGx5X6heOnsrd6wRyRWDgTueVQTyZ/bZIACYqkVLyvzW9Q
	maMKwm6boIuL3SYiwZiQe4e4YvRA2dQQDFQ9wQiUeOJKiyumyWcOZNLj/WM36rY6DfCXeKINn7o
	pD0GqV/jJXWDMNNzKx9BljUFvu7NBWegqV+sbkHR1hKYaPsZ8dfrSDNz8UZUT0xgtgICvrH7gL7
	0uW4b1NvdP74bXBXeaehJq0VHN+J8aEbtdzYq+3oO8DV4pl+q7FbAyZlOKmAFVDHo8uAZcdlt7E
	u4nVt5P+Wi6N8/PIugzJGEeAkOW0ZVAPJUdHNST0lp9Q/drb6Hp6OHCjzFoMn5jrdVpLaMnbnZp
	BeZJt+zRaub9pS4K1sK1adjk5AdwDU09xm7I4vP1YKrBEl5WW5snOSwJUqLBXmraQbxjjJOwSyV
	zPymbz7iNG3dkpKMZlwGyhdHoj9Mji42F/8cKkuaI9vHMT2Jbr4BeRnFTTfoahMGnYS8qGczU9u
	tO3F59DHRd0leRh8Wm2/RUa0odgKeH+XsXqYxZpzV46FWaJWZVNAFkhyg9kqFFsnPBJXuM4/mDs
	J28GFmDwDbLeHdC90kwvfla79coVXTYRQpNUbDHBpPygJkEPVgc3CcJXF5gW0g==
X-Received: by 2002:a17:906:25d9:b0:c12:5a0e:3e0 with SMTP id a640c23a62f3a-c25b3d16de9mr526219466b.19.1788275533752;
        Tue, 01 Sep 2026 08:12:13 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b5a4esm609802566b.32.2026.09.01.08.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:12:13 -0700 (PDT)
Message-ID: <6a96eb4d.42d66b02.2ade6.7864@mx.google.com>
Date: Tue, 01 Sep 2026 08:12:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kaloyan.rusev@elektrobit.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v4] Add Eclipse Ankaios container
In-Reply-To: <20260827093704.208717-1-kaloyan.rusev@elektrobit.com>
References: <6a762483.ce53cff3.11d7ee.5f7c@mx.google.com>
 <20260827093704.208717-1-kaloyan.rusev@elektrobit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 15:12:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10074

merged

Bruce


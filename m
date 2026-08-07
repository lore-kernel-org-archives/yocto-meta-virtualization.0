Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D863DC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 18:05:10 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48471.1786125904291080809
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 11:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lI89r7DS;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5283e3eff60so23235131cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 11:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786125903; x=1786730703; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=lI89r7DSIgevPYJbtMA3lBlWhwOx9Go3TbIOZgLyDBso2OS0t/5nVf2D+Z/ptZr4GE
         9y+lM0m9ZBkFJv6AdFwd0iwI1pXokoNxekT9d/b/V8WxoicmJWi/rJmb/qtcTJf5BLQs
         gpFUMhNj9JYA04aUHLEbPzyaxWKKqwqdhPBhGa87737nEtgiHlB90XO3Sd+RcSwJMwd7
         ED6pYz0GP3sC9/rJcXqsImo7j+u84E7C7XSs+EhZxwKUxufDSfZOemERQYauHWlGtKvH
         0G6BtBOFa7ZuwTsJuuSXx9AkFHKZt3++UH171bwGgnRIQ7C6OWJmX0y6SzcQ5nSQ99xO
         FXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786125903; x=1786730703;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=ZclnDa2d1e/6jUuGNJOU8ixos5yb4OxaxZoqZk+9sfcg+2/I289IcxCazhK0s8h43p
         w7bpoayC1tnytmrzkRmdHctqLNXdU4GV+fv7LXy0tamxnJ2KY//DuVkBnajCxKGErVil
         atBe8usRR5n9zysKknldJoPOCoJTEO6taaXvOch3x6u1TdVre3YEwOeC0k7PXK8ya9KI
         o2HOb4UW6V3ZQ3+Yg8c9FZaha8+HTnbwsihNfMgzw9tgGlj+oIIP1DSRuVdXm4yLv2uF
         mpiI0TexWltEeUq0XmBoJwxfT68pMJ4GpKLDZ+yYrZZ2Stpm3qlgLIoWSJqADPWUvTS/
         vZDA==
X-Gm-Message-State: AOJu0YzbPA+Ku//VfM37CfVpiLsUTagQQINmKmnZyYombgd0rFLV+V8x
	DYjvB+DXf1rWd9vXuT67WoA3cQCAE1cXpdueWjAcey+OcpzVHTsyXi84a9cJj7x7
X-Gm-Gg: AR+sD13CU7zTkxHCDj+ScbjpZOJY8q0LGv3ANoBKpa8reMjVKVXMHcwpwlghuV6KNCS
	M8kteOO88Gfl4TjAGsIQJBPB/n3oiikRhuK8tEkgjpQVGNMox5fAoJ9UDsuFookhC/tSoqiRd5W
	IcW55Ih5kzMXQfKwddSMAw4dE8WUCBzgPHawY5GlcHkCEKmQSWhJ9eiIC1efDfQ4BM2JkRIWb5m
	9xNWlLfxCJs6HqHvmj0y8KD/iKb2xY0V6ziWFmJe7OinfhT3HNl728em/wCcm9Vv1emrBzgVG1h
	CfiQwdGAnJc6UPVXPa/8Hcybd+J+aG8/tCebMw4kTeHgTiOIMEWt1iAYYawwWB0zr6KLDGIeFhE
	6yf5WK4WjQ6wGGSnGEqUF80pmZGJWl8M9HsPFKpr1PRKf97bnBybEizaW/hq1Fp9uzIKYI5OYaM
	Zhd3gQWdQizfLNCSdgJpxyESceZ/CPgAQ0pX3mikeYyJyEQH5H9xoECJH0+Bop+G0VGtzU/zoEr
	uv/P9qVSAZBkq6AT7Y3gVdKl5DMsR3YO1DbqJirTvT10awKhq7fnBYiBcheOAlaTxaIHG0qOY6n
	rDNaM9016v2HrD7RWGufFQbjnBaN3VlRIJP8no6pHp44aRLwMI/AIRx2urFbzQ==
X-Received: by 2002:ac8:6f1b:0:b0:51e:e5a2:ac82 with SMTP id d75a77b69052e-52ce60d5114mr310089871cf.23.1786125903034;
        Fri, 07 Aug 2026 11:05:03 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d165efd05sm16999421cf.20.2026.08.07.11.05.02
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:05:02 -0700 (PDT)
Message-ID: <6a761e4e.929880b8.1f948c.cd42@mx.google.com>
Date: Fri, 07 Aug 2026 11:05:02 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 2/2] python3-webob: fix
 CVE-2026-44889
In-Reply-To: <20260806055455.3114166-2-dkelaiya@cisco.com>
References: <20260806055455.3114166-1-dkelaiya@cisco.com>
 <20260806055455.3114166-2-dkelaiya@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 18:05:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10037

merged

Bruce


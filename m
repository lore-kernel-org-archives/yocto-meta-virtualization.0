Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web09.13200.1580150959920632361
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 10:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P+0o3umx;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id e5so8207677qtm.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jan 2020 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g2Cmz4CkqL2knMkLClRyxYhubznv6JBYlhFuh83uaEk=;
        b=P+0o3umx0VbGK37OEofcZjZ/WPGyGV1PXCEhVCxDD3CODW6vFY9C5gKEXilr1h45BV
         e101j1lhgmWVZx5bBtoGTYDUi5pFgsAJgw/k1K+QYHL2xzl2RLLHM6870yXbXmWTQG86
         29STaaKz1pWGkm50oOZUYbCamMK+pDEh6maEXv7ryHd2Gr4M3qQM7d6sqPA0BghZekJQ
         Ce29rh63q0b07KK3TXv9z6ln3pHaeHoUs/H8rLsLEJBohVU0nQklb80FMxa/d+8KazmN
         dELlMD5nflDoUNU1RX48g91fKa8AIJ8vDb3KpDRisqDgaIoFNC3Zqay1hSmR+kcyQt/u
         Vy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g2Cmz4CkqL2knMkLClRyxYhubznv6JBYlhFuh83uaEk=;
        b=BN3liCeQSGvi5kFW/kv6yuCUdDaIeQh50RvanAlUde+qhWfQeXCYV7uObjkL3Ik1Wp
         NACKvi0kSxPHIHX1ZEB31mijL7VspJWjSB8qOMJsnQ6B/jhamP3vcweNUiMrvakUfZwl
         igEqG1dQ8tshWdtIjmgCrr9+evvjTR5FhMP7mj4lTgUe4VXgU+KRtO/Tcg7kPqO8kfcP
         1+RDo5oIbM5QqX15ZgUpZW9GmCe5S9tDMHOUMgKjE0Dg0/WAEFJlEidCG25RE3vW8T/p
         Cs+aga6TAo//qvOHANNTkHF5bhgFXOLsYF6VXQAAPZZVZ0lLLdpbodI8tqUtuhnMjT06
         Wl3g==
X-Gm-Message-State: APjAAAV8xsskFN/xSf6AymX7C4yWzO9SF7yknmaK1Yw7vo4pXyRwqmqw
	37VLBmdIQdnEwULKZMINTUw=
X-Google-Smtp-Source: APXvYqwGZkaBiJRghZ9+LtE1KCTVF+wu24+Fm/wKumPQ77LjOggutL93weofKLytaueP0yFDRB/bTg==
X-Received: by 2002:ac8:1205:: with SMTP id x5mr16898705qti.238.1580150958868;
        Mon, 27 Jan 2020 10:49:18 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id a200sm10543885qkc.2.2020.01.27.10.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 10:49:18 -0800 (PST)
Date: Mon, 27 Jan 2020 13:49:16 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Rebecca Cran <rebecca@bsdio.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [zeus] [PATCH] Update uwsgi to version 2.0.18
Message-ID: <20200127184913.GA60113@gmail.com>
References: <20200120235453.11518-1-rebecca@bsdio.com>
 <10748.1579564602739277181@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <10748.1579564602739277181@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: Re: [meta-virtualization] [zeus] [PATCH] Update uwsgi to version 2.0.18
on 20/01/2020 Rebecca Cran wrote:

> Sorry, this patch is against zeus, not master.

We don't do version bumps in the released branches, unless we can show
that it is only a bug fix release.

Also, the change must land in master first, before I'd trigger the
cherry-pick.

So are we saying that there was a python bump in zeus that broke this
recipe, and there's no way to cherry-pick just the patches that fix
that build error for zeus ?

Bruce

> 


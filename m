Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.930.1793898037950142300
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 09:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VsbwH/8W;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99911ead46dso956963241.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 09:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898037; x=1794502837; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=VsbwH/8W/6uBSHJL7wngT62mRyMYDW5yDOSHa+cx7LimKKdiyTlXWeJ9aq8dwySxES
         4DbB/BlQMBdiVyfYJnqESz2IZcrHLK3sAdOIOcXY5/fylVsG+AK5e8qDHBV7FGpUIILS
         Nn1gDCEkx7noPZ+kYjUvLNj2Rgvn/SrskS2RsibbtSIwjtV+e9wi6wszkRDSul8UD1/L
         S+JmcgZ7hw9+PPHqO/fLVr/rWK+7OlL/ugC6NVC6pzdCte4nxLxEG14wKsQ0gUTWcN2X
         MY0Lehe87ghNvGPnaWI4v/GuUomKmX6YkPCu5iMQBpn9xDGaM5MR3uR23AlpgLYYd1Ej
         gquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898037; x=1794502837;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=oVWb7qEHgy0OfBG4KiV0H7IpqvCdfqrOC66pu9wt8G2nyRKh2/iJOK012kgl953sH1
         syw5eoj8RJ2IPelGM1k83PDVyD+CBVJI4e25ZpVmkCyPtXeRpPCLlqT1hASdOPhW5EiF
         P1X72lunOL959yn4UkWE4vROpblQ9WBuDZEGvnKxP+AfvrWFzvUPntIy19A9qgw3s72N
         JITcAUBsIK9CCk/R8PrXbAHhmtgHzMzzNbFFs3I/XtMF+WdRIex2K24SnMpli9e9HrbG
         FtowVKO+/61TGoPmHas+YLAohVwYjLYSueAQiT7mozmAVqQDrZDhuKd858C5aMxoXNr4
         nNvw==
X-Gm-Message-State: APuU4Z/lQbAqFzbMrPvq2XDNAl++9Z7BlCRfYGBJTImwLPnGmF4Lanx/
	jyTmWmvb4jATHaVuMfPe909LW8XubZ32XGFXBt09wJ1A8nD4pR2PPjEqSuJ9oUbv
X-Gm-Gg: AYBFou05+cV/oKtWLJLV0kJ7/0zIzVzuYNMusOZPsZdASWWY/PIRI+oYJWgRs1EAnxy
	GgSGO4K8mCWakVZCuRXNhh0QLUlqKSi9HFW4MMLdyi3HcOG1I3dZ6OxDbPboUkCIjY0pDCdgxWd
	IzQBtAua1M6nIQ92GKA1PJRS9vDjYJzPQTteGpd+I1lNv3M04asdzUfrBnLkWw/2ENnqCGbk84q
	dbfM4ubScfMdI10pxhYHenIJoTgadgbUW3LtJV8nGsT7Z1xiBHtum05k914pMdW1i7dS2aKGy57
	wXRPeacKxeeBvDJ3y5Ld+y2Wju1qS65Z5SFRIjUYTFFI3Sxg/1ovoAq5VwUw1S4ZkXsCSUKQ5hs
	72xuZ6+hhiDSoqEG4uCY5DJc+bChASi4olUF8SfvlveVNAyyxoyft5XbHMAC2X0IBzBBCWN6nUs
	WZ2PHaLQGbKpOOqaEyYuG82jj2Qhlv72eeUqjw4QjEcq9YpuQNSrJ44Ltopc1lIFX79WsJfG+2p
	7ps/BCyL3cjODpNJ4Lj0qxvftu4wctajLy8dYyh6fsBNvhH3AgJDqkWjlVeCuKZvfKuq6k3KDi0
	NFD/7CrvXaZbxyebFcVIhDEydpbZGQRLpWw5DGwIIYgkJhrXUtlg+NDQPKeSyVi8akp3zne3+5s
	AFVcA0g2uL70G+b8l3Y/vupYE4PvHAzkDGy4+xK3ytAvnhj+mc/HE
X-Received: by 2002:a67:e70c:0:b0:7cc:828b:421b with SMTP id ada2fe7eead31-7d2a15097e6mr166331137.6.1793898036540;
        Thu, 05 Nov 2026 09:00:36 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d277d13753sm4019647137.10.2026.11.05.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:00:35 -0800 (PST)
Message-ID: <6aecb633.672bd177.2e7e28.2874@mx.google.com>
Date: Thu, 05 Nov 2026 09:00:35 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Deepak Rathore <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 4/5] docker-moby: Fix CVE-2026-92543
In-Reply-To: <20261105060006.1286469-4-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
 <20261105060006.1286469-4-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 17:00:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10158

merged

Bruce

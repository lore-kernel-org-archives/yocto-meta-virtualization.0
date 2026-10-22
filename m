Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103.1792696407920532420
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cWdA3cDn;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ba8fcc684so2243846d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696407; x=1793301207; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=cWdA3cDnrlMwLBA9d0bW/AEM+TfufIqG4U0XS/DPYpkZ/DOc86gaiHlwyzibCXGlnG
         EsPauuz/GRm+flEXDcEh72fkzsczaWOv6xSOZLWgZg8P5jryOxTU0qXSYRqOiK4kpzhh
         esmBBWNT48spYQl4tO1yF+a/3PQjZ1jm2Iihi9RmT/MHVbrnp/2QcG8RnVm9+gEGl3DQ
         CF/XwhYlSD6g7pjIR9ddlKLljCgtZbBLsuh3yD9rdg5nCNVAEWty9trbINuGcesktsEr
         U2Ie5AAzmXET23KKrefJVObnqOB7QFuf0uIpey6bThInnfYgGdDLXh2iZvOwE3XojSS2
         WUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696407; x=1793301207;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=kjXVETgY5isoUM6MnkhTqZc5CrpNZt2f6DkdYvE8n3BaeT931qtznl/R/c1VTqWtr4
         dM5+ZbCoD3PKuH8DA5sgVVBMYxM5HX+QhvVYT+hfUO/2HlS9/rNYpyHA4Sb6hC35fIW9
         SHIrpH+6SV5OzNH/NGlIaZRDwfAb1igesXcLATv598e3C0ysThLncm0+Ln4686wCzqsJ
         aByVrwjJ55yXhM+igOCnii9JhXYCf4MqYmGFhPBa+qRx/c/CM5K2Smgnny86PKZMh4cZ
         pVnOZJtoURrfG5A5M0ZHC52/0lh+7FpB/TI+YdAyGt3x2oOO/qzsuHai1qPkG78NnoLW
         vlqw==
X-Gm-Message-State: AFq9FYL4MlahN+KPjkmMI1iJPZmM9XOxGbscxYGQmIvJ4hq/5Zt+0dEK
	hRAmXPvAdil2v0jeFIooQgI5E26h8iQ/1aN7wcMYll653UArOGYpvANQqtJvEy79
X-Gm-Gg: AYBFou0LTv+a1GR7YEAGRo1TPKJVrCAtuxbq5DjmL8LS1PzfpT96jKkTP9BQ359+dBh
	mZhxmlzCZJiFjr3GAFGTXpTkA2wyNwfVSvOCs1bNkCgdw+7AFquBtaRjoibK5OV6ME5SRchiNq4
	m5pEfcyjtMjqXE2hf+7dWZkM1drG9fa6Lph81BbTC7xnyrlIfKead/26pmqnhFNq8TvaTN6Hv7p
	uAK/5prIcqcfpk40xUA4hzkIeHxdEUKDEp8bEEkx+3zpYA3wCjz985rHy7vOwYbi43xecjwbofA
	R3PoFFYjT3dELgxjyv6CqxOXYuQzITDDUVXG+cf7kZzC1mNSHdeuOTzE7AQVvnSfPWUxXxo2HOH
	cDP5bYJRq+xqTaTGaUtbAhped5bMyf77GL1ldsJdXJ6cVh9YVA1WGEDOm2j/b9UUUJrp5vsqwCK
	a2w7bX7MmUfaGSWEdL5kCczE+tP0Ma+8ZAkusxb0FFmu4lyL0COcSGw2swQzzkOrIFpBGQiwEJj
	f6xa3H3uSsbtfvwTOTRDDPaq5/JbJTu5mTaWGofiy3PE2GCI9aIxYCmLSPrnV+2axOLZWPclUhF
	32kj0ldglXJJZJoUNV5boPVwaMuUvTafk16VAt1F5mgkc585VbmLIqWTVcUSM9LJnPg6guKv2uI
	pcLDuP1YXBozsEb+BRRvynX2xqRCvLbWNhnH/jf+Fv49x5VVRw25m
X-Received: by 2002:a05:620a:17a7:b0:93f:2eaf:64cd with SMTP id af79cd13be357-93f6f826be3mr70019785a.50.1792696406580;
        Thu, 22 Oct 2026 12:13:26 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c39507ff0sm247016d6.4.2026.10.22.12.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:13:24 -0700 (PDT)
Message-ID: <6ada6054.c71d9604.243ac7.5345@mx.google.com>
Date: Thu, 22 Oct 2026 12:13:24 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: dkelaiya@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 1/1] aardvark-dns: update to v1.17.1
In-Reply-To: <20261016062555.3887753-2-dkelaiya@cisco.com>
References: <20261016062555.3887753-1-dkelaiya@cisco.com>
 <20261016062555.3887753-2-dkelaiya@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:13:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10133

merged

Bruce

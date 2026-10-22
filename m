Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105.1792696409435322273
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tLer9QPH;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93cc1ab5f6cso12339385a.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696408; x=1793301208; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=tLer9QPHce0rUY9mL7bU1X4x2YgepZN+vx9OnvyyrT3GAr461pR+qbgWd69yr8LN+k
         Bf8md2WOci1Xx2zITAI1vMpRQPItZu3bg49hCryo8BOBHe/Paikpqr5qU9iKsJhnbM8L
         w/U8Zg29vS55fWZVUcNqg/qLGgVxJUXvnziBsL/LiOWwu9FIO73gK5kvHWHg63GIEB6z
         nVma/CfaMBfwQxtU9WILbiGmhPqVwaOmszehOctM4STA1uH1XsSKWr4FqezmU0hBnJna
         r9EMe6+NbD55Kx7Zqx5zygljXgeZnL92zAJrQEGVPMcBORZMgTi7YT1GJv22SHSThoj3
         ycjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696408; x=1793301208;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=bk+TMql20CK0B4fwrEAX3sbtWdM7WFL3wLIl8MjKpwM8gzD1SRM5Ps2ugERmjdNQyJ
         FvtxAXi58ag+0hWsa9HZOtWnDmwd4u+VKPjcYYpJb0YRNYiVN8gfjOsDvsLmi2ZET1fL
         0PEiZlqEkj+EmPFKhdvgMlG50ODn7EQ7SwTxIFKqsZTJl0jeu40bkNL1vdK/6ydOkalu
         1LzgXBsVMVzlCLQLA7N7a040y9sruR2qU+QyhPxp2j/GanF0RnS1vB/iox1UYTWt+cSS
         p3HOQfeusZwsUDGj4eyr2YB7LIjDQIzT/IgI9Z+Ght2BDybltjwO13jKU5FebBuLNSSL
         ESvQ==
X-Gm-Message-State: AFq9FYK9ApqqnrYIvY8mDx9qKaOJcFjdHbmBJ3g185lhC0jVJbNNrsKc
	Cse0Y5dKww+kWXKv6UNgX2rC3888MBLYtsa5f3CRDbkt2U0kb7FDHh0RpGD+z8m4
X-Gm-Gg: AYBFou0zt6e81sjLUjbXi6fOXZ0NZA0FDe8+0al/1kqZcmu1+zsuS3DhOuAVLfK2m8Q
	k/ZZeU/hcOgMSL5GPG8yf8wQuB3FUf85a0KOb+k32l61pxWZuKz37fcjl5CXXFD30/ByywovVJM
	N9ETl7py2nkptcsGjM67X1i6kL5UTxe5ksgpy+M4i9kYOD95AYJMtM8o1zQ+9YpcsNAeMx62UDS
	vfSBOQFj1MmBUOvoHLSuZwWjo+VCPmpPn1024ZaFCstALEO1lLSw9FUzZzX+rvCeGrMM/xY2e5v
	liQWtsu8E0mxKWdyX8iL9GrZMVpyw5VqOOI8oW/Em8Z6QjSol1PAZYZtVXhZmAql4nRx23GVMDQ
	zuj3meOw1WWVbQglMcaTkf6mhpe3J1EmQNq6OrSraOvbjSl6v/0N4jJC+QRiq/iJCUxy4qvJfhG
	4hm8152Gw8tKPZC1ArS1S4vlibAvJyyv0vI+aitIFAN3xi1hj/Fde6yJno5+J0m/H5ppiVF5/8C
	hjaH1hDxUkhx/E1iF/FA5CMMTq33aehrbnCIazwX0TBoLAN7IJlsBF9bW+1/Sz8i1OWrWYbhyWY
	ITextrlpg7JieoFrALze2pGWmkHJcXblWreVRX6uNJhEoNQ/qxK836On9uffNQsYjaKKoIpqClJ
	rBHrz3h6a/d6sreVnSbCvDk4BykI8S5kvS8335N0AUMxYt/fNNSg/
X-Received: by 2002:a05:620a:2611:b0:93e:a689:2dea with SMTP id af79cd13be357-93f6f964df7mr74632685a.42.1792696408164;
        Thu, 22 Oct 2026 12:13:28 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fba6481sm26405885a.16.2026.10.22.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:13:27 -0700 (PDT)
Message-ID: <6ada6057.e947ddf1.192206.80db@mx.google.com>
Date: Thu, 22 Oct 2026 12:13:27 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: hthakar@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 1/2] grpc-go: Ignore CVE-2023-33953
In-Reply-To: <20261015044008.538247-1-hthakar@cisco.com>
References: <20261015044008.538247-1-hthakar@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:13:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10134

merged

Bruce

Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D8CC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 11:18:22 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.18653.1736939895119444006
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 03:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uCp3qJ6g;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30616d71bb0so35955561fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 03:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736939893; x=1737544693; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y68vL4y9T4bhKyzS5woN/PbSlVfGxddP0Q4vDHyZyO8=;
        b=uCp3qJ6gYwrQkNlQTJDFCxbCoJuzWRSnmpMavO5b8XI0ppgkmrIAHP7VkUJTS17A35
         cORP6om29NUNhnlrbG1wDykudLKu4WsnzOsQStcq7zBpbP7YArDstmYlD9X7M+UE0/ES
         eEi2JPNK7Se0DIq2Ai5gGr8+34CXUgGm8AAtQGNiOapgBNKmCinIF45xMYhpXZF0YXvi
         oUVEsslBxfgSZwyZlCPuiC5u4qHCtaMEWbJVhtA1jxZ/366om6uoIrvir6hwkmqhpRW/
         i2+i/sguQHyDUkusq+itjdH/aDJ/TxfJL2++xQnZ/AKXFJS2ONg37A7heb5sTZzy5qMu
         7gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939893; x=1737544693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y68vL4y9T4bhKyzS5woN/PbSlVfGxddP0Q4vDHyZyO8=;
        b=REApKARx8c1KC9BWny8DE386LaZtbv4HT45YLobU2l7GPJ9keLhm1ohOulSeQVmLPR
         dsNhQvQFQUTSqG1VJTbO7klKqVfS+4odnyu3IAVFN91sIgnkGeNBH9z1v5b0QJQkgDC9
         JdrLkPX2DjXfXKm3l7WB3tPZ/e1N0+UN7cnrtLvLjCSchYQsgyFiE1o2YXEusLQr6NeC
         brk3JqJ5nd8W+MbSXxAC0HtBAOEZ9EVGEwvmoZQDRwamar0ISez40ma3sjcqEKHqRDcY
         pFNRHuVZcjAK+ihkFisZFoasXtXWtZ0CPAcWYHUO0gj7bA9xkmVXbjKDG8Korgo8NcEA
         TwTQ==
X-Gm-Message-State: AOJu0Yzx7BZHmL/Y3CDgH8X6Q7fWqhkJMA++Jnl9qib1Zn4FsvdogrkR
	wZdwbYXyGZa/dymgKlVYJnq8vX5UE2NAS39b/CFpkDmK3LHQ6WbTQUDsjjD4k0x9fARqlrUqLQ7
	J
X-Gm-Gg: ASbGncv3+51tOY3O/qtHkIx+UvaGLbqId5oFE/4kZ69Vk0jEXbZC4Z0H8WXQ6NwezuA
	nJHY5oYYbht8ijqU1UoIeofgwpzMZl7Bl0vtq8bYNNhMLI9MYYjI2AHhSVjerkKhbvYZp7u1cI/
	P8pMrkmf1mOpUQyT1R1zfGlX+VFelZ6UzlAamtkSgOm1cMdcPPZOVVfj5dkpxKU0UI/bf32vww4
	6Mui3iWXLnAGJLXhNXuIUn2U26EU4Ga6tKQAFU/cEd3LYc1mmerogwkLc5vtJx88TwppLvO1B+C
	6HA5aQ==
X-Google-Smtp-Source: AGHT+IEz8GikYiHXb5KcZl3802lAXQ1KO1EVt/r0QEDqaUspdC8X0CZ1za3l5mh65qMgAb1eM38yFg==
X-Received: by 2002:a2e:bc04:0:b0:302:336a:89f7 with SMTP id 38308e7fff4ca-305f459ae71mr118228941fa.18.1736939892916;
        Wed, 15 Jan 2025 03:18:12 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0cfb57sm21342861fa.42.2025.01.15.03.18.12
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:18:12 -0800 (PST)
Date: Wed, 15 Jan 2025 13:18:10 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] k3s spegel download failure
Message-ID: <Z4eZcpDn32qKiT9i@nuoska>
References: <181AD785DBDAB9B0.28670@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181AD785DBDAB9B0.28670@lists.yoctoproject.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 11:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9085

Hi,

On Wed, Jan 15, 2025 at 12:39:30PM +0200, Mikko Rapeli via lists.yoctoproject.org wrote:
> I've reported this to upstream in https://github.com/spegel-org/spegel/issues/697

Upstream developers pushed the commit under a tag and issue is fixed.

Cheers,

-Mikko


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04192C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 10:30:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.7502.1648031449146824404
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R+LVWeab;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n35so631446wms.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=W+BBUEY0TqZTLT75zdMnFmf4aq71IgF6PwesxCb+k6o=;
        b=R+LVWeab0c2XFBaj/eOQhIejt2AUlGAjQfhmpC7IAQAE75o59Yd+HHcu+2oWz2oOqO
         MyJbSnm7fGKXKBXdj006+P8hTtX7DB86ZMKpRLf1WGhI/SgbWPrwikHMtH3MP9V0tvm0
         G2xQn+W9Vote01o4x8xrfQKEuWfl8ClgwGTZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=W+BBUEY0TqZTLT75zdMnFmf4aq71IgF6PwesxCb+k6o=;
        b=eIiNd6QoXAWY++vilOLujv0rG3ZAeMWSJVApJmm2w1qM2c3edK5C8/0mW+tNA7idxu
         NDTTi2Aztjy4Q/KsgcxXA8Rohdh55IGaT6JVXkHlxnHbHAV8BN/Ci66f6maLVIpq2PLN
         5+lqGxgPGLhdi+FnMMgfnWxDwtSE7zqJh+6DBT40d80x6e+RoofO816bgkKJ1XflUeiz
         ZFRiQn2i8As3AtWTDEQ4vY4sG3gtjD+g1IE+iPVYaNjd/SYYOGfE3aOZuvmnynsB11gI
         C6eRLseGcoEXni7WQl4ZzJZkOOLRrFex2XGTDX+cCBFDPNMPUyZ9ZXA15EepGWySe4tl
         423A==
X-Gm-Message-State: AOAM533fDMEF2cuOyq35ABlsaBIIrnaeI010ETq1N+tXjrLIKsswGRtL
	Q/kgKnuzPokItVskQtVGE7B0EA==
X-Google-Smtp-Source: 
 ABdhPJzhvFQBKZ2CnFkIPJBr4qryDDcOIhbbKT6uH2adJ3Le9SomBTtexY8YRiRRqjBdqlX8OXjmzg==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id
 m4-20020a7bcb84000000b00382a9b92339mr8710298wmi.91.1648031447629;
        Wed, 23 Mar 2022 03:30:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aaba:716e:9c38:ad87?
 ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6dac000000b00204119d37d0sm7404074wrs.26.2022.03.23.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:30:47 -0700 (PDT)
Message-ID: 
 <7c3e09f6d8b36e7e8573384f4dac48f93f5f40ff.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>, Paulo Sherring
	 <pauloasherring@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Date: Wed, 23 Mar 2022 10:30:45 +0000
In-Reply-To: <7ABFA491-0F02-43BD-A187-1EBD36E6DB97@arm.com>
References: 
	<CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
	 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
	 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
	 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
	 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
	 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
	 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
	 <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
	 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <CAG9RwP+_FzmRwL9O7wMuGPOtVDjh30Z=UZNfeav4ELxga=8n5A@mail.gmail.com>
	 <7ABFA491-0F02-43BD-A187-1EBD36E6DB97@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Mar 2022 10:30:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7108

On Wed, 2022-03-23 at 08:38 +0000, Bertrand Marquis wrote:
> Hi Paulo
> 
> > On 22 Mar 2022, at 16:52, Paulo Sherring via lists.yoctoproject.org <pauloasherring=gmail.com@lists.yoctoproject.org> wrote:
> > 
> > Hello Diego, Bertrand,
> > Just confirmed that by bringing these changes into hardknott, the
> > modules get correctly probed on bootup.
> 
> Great thanks for the info.
> 
> @Bruce: Maybe it would make sense to backport this as hardknott is LTS ?
> If yes, please ping me if you need support to do it.

hardknott is not LTS, it is about to go EOL.

https://wiki.yoctoproject.org/wiki/Releases

Cheers,

Richard



Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.272.1623702801408706738
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 13:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LC9FpLKe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id n35-20020a05600c3ba3b02901cdecb6bda8so231156wms.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jun 2021 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=smyJtTrEvCP7TH1KFBEjzDWVF3fcOTlOOHhuUrewLOs=;
        b=LC9FpLKex9/tvE8RxZuvudThzfBWgtcuoMlWUDsYQWbWFpFoDWpoGUSo7cTQqUjqYQ
         HrwU6moJj5sv+fi5sOFPJdLszZK+ihAUI1vr74w6X1OnsWhusGFc5masbRNddPc3iOl3
         S/f6DiBNV0Ytx0lO7OaneoNa01nMBDPTIvhJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=smyJtTrEvCP7TH1KFBEjzDWVF3fcOTlOOHhuUrewLOs=;
        b=LIzVKQM1jsd2e1yieK9RI/1QrMXOIZ8rbVfcjkSvSi63/mxIXS8ZgXx1vdxLtw12yD
         zNeVqRoJOmr/Op9fd9/X2TL7l023CvBBOaHOC6mfZ3e+snDNxGgWgGEkQ1qtMtGJ3tCU
         ojm/tF+aGwcb560IYH2h7hiozB81mYTowWb8lxcbY7wkiiV/pd3vycxuJOQcaPXYyZwH
         je0PgLP9Qn34gcX43mr6P/2+E+hEeXMUoNE/zVfE+Eun145LSxefzjR3SftTU5fm8nWM
         brBzK2kDV4458ON7zQblbatc9DszGllQkxqo1aDVtlupxar7r4i0+tFP6trs03H80XEb
         U6GA==
X-Gm-Message-State: AOAM533foZFVBgMqD4hZNSrvuUhvVxyjqoq/cft9Z4oK2nhE19r207Cf
	bF3FoJlgFZuiib1PaklQEcRuKg==
X-Google-Smtp-Source: ABdhPJw9QpXrUz//LGffHZNJMoVsyfhRZPCNAPPQb/UVLkK6D+2Q0OO8Nrvnws7kvnat44JQc2en1Q==
X-Received: by 2002:a05:600c:22d7:: with SMTP id 23mr950905wmg.119.1623702799849;
        Mon, 14 Jun 2021 13:33:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c376:a25:72e5:3c84? ([2001:8b0:aba:5f3c:c376:a25:72e5:3c84])
        by smtp.gmail.com with ESMTPSA id w18sm17117670wrt.55.2021.06.14.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:33:19 -0700 (PDT)
Message-ID: <254de5b76e238bfae14c0b3d2376c99af068a5c9.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] Networking issue with l3s when using systemd
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Matt Spencer
	 <Matt.Spencer@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
	 <meta-virtualization@lists.yoctoproject.org>
Date: Mon, 14 Jun 2021 21:33:18 +0100
In-Reply-To: <CADkTA4Mynf55A2NjnZ0ao2-7S2JWKsyXnwO-mJA5YHQp9psjnA@mail.gmail.com>
References: <qTwn.1623666439663990628.RPs0@lists.yoctoproject.org>
	 <CADkTA4PkCG-xJ+hRANh4_tQFRdBGHrvsqkj=_Y_SPyK=Ru-fDg@mail.gmail.com>
	 <AS8PR08MB701191287DFA90A2F8408D7D95319@AS8PR08MB7011.eurprd08.prod.outlook.com>
	 <CADkTA4Mynf55A2NjnZ0ao2-7S2JWKsyXnwO-mJA5YHQp9psjnA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-14 at 13:59 -0400, Bruce Ashfield wrote:
> On Mon, Jun 14, 2021 at 10:59 AM Matt Spencer <Matt.Spencer@arm.com> wrote:
> > 
> > Hey Bruce,
> > 
> > I understand that changing things can be difficult once launched.
> > 
> > But looking at the systemd documentation here https://wiki.archlinux.org/title/systemd-networkd and in the note that says 'Devices can also be matched by their type. E.g. Type=ether for Ethernet, Type=wlan for Wi-Fi and Type=wwan for WWAN. Note that Type=ether will also match virtual Ethernet interfaces (veth*), which may be undesirable.'
> > 
> > I have created a patch that modifies poky's meta/recipes-core/systemd/systemd-conf/wired.network to add '+Name=!veth*' to the Match clause which the team at Arm are reviewing with a view to upstream.
> > 
> > I feel that this should have been the default behaviour anyway?
> 
> Perhaps, but it is probably a good idea to have the default as broad
> as possible.  If someone comes up with an alternate requirement, you'd
> end up having a harder time keeping them both working in oe-core.
> 
> We could also carry a bbappend in meta-virtualization that triggers
> when "virtualization" is in the distro features. That way we are
> providing an override that makes sense within the context of the layer
> that is providing it, and the distro features that are enabled.

FWIW I suspect the veth change should be ok for OE-Core if I understand 
things correctly.

Cheers,

Richard


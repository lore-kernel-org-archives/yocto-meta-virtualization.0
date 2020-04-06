Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.3704.1586139462574545447
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Apr 2020 19:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oA5u3dq1;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b62so14764141qkf.6
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 05 Apr 2020 19:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Uto6gr/S4UQa/KFljcLCbVdLu95KYZWBZaMsyYzA2Zc=;
        b=oA5u3dq1o0Raf++Nipnv+fgZOhqFDTJWfSxkhnARMn0Ii1rnstq55tUdgXZkyOI9WU
         NHWvvVK47ArSc4WXHrRNa6pIFkeHuikNZKQp+Ybm9XB7cQ/0IruhvdHElxkb9UI1WZH6
         0zklw0xWiNHZuKBzw3PFd7Utxhf2s9QULatN9y8tdrtq9U0E5vFFMttgDTVRI2oCcURu
         Ir6DBkWReqcvVGzVlc8Mhvw/dbCsSHOIXj6/ForAOqy/+kGWGq+BiPK0lZp6z9NEMYbN
         /C+AobMSW1Eaa2YH9+KXiq2R4MG+5v7ZZ/BBVRH420BE5/ZKLN2RsUwghru8enaprVeT
         wvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uto6gr/S4UQa/KFljcLCbVdLu95KYZWBZaMsyYzA2Zc=;
        b=VtgGPBkVQyoiRjQOVKM1UeD8blFHTZPqetyA7rC54FoRexZMnDnmqqes2PCkdKejYq
         VFAzL3kghRtwmLsUpIJvc9zAKewxUZraUTw/nPzm4U9VEMfvV9fyvwfnE7b8Uo1yKiar
         TIV7OBv7gtTb9a+EbsfuJwRDmLmJj4xmy43ZyWbAsGv9ghvbJkL1tiutGfbVebcetq4A
         heb1JFaebDq4hhVATECKWsbQe0668i94y9SahLuYtC7nir3C5wUrGsYFalZOSBXvlOGR
         C/tL+VVx+371a0iMcpe2j5YneZjd23LCwtnh88IiuEGXxyEmPEfVY8Qgi5okM3+SwOWx
         HeGA==
X-Gm-Message-State: AGi0PubscFrJBz6EASOVXqvqr/G4FjKtSSM70Uh//rbhXI7q+ZlCPdfC
	y2Bgkl5OPKKJaSx92SsMvBg=
X-Google-Smtp-Source: APiQypKn1TJ++BAZ4n0qwoSTRVNbfTHnTiZbGR2ZfMg8UadiVW/japzBN1F3V6LHyMn8ft6UzCE6hA==
X-Received: by 2002:a37:4dc8:: with SMTP id a191mr19963261qkb.450.1586139461730;
        Sun, 05 Apr 2020 19:17:41 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id g2sm1286010qtj.96.2020.04.05.19.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 19:17:41 -0700 (PDT)
Date: Sun, 5 Apr 2020 22:17:39 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] libvirt: Add setuid permission to virt-login-shell
Message-ID: <20200406021739.GB54226@gmail.com>
References: <1585807413-197736-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1585807413-197736-1-git-send-email-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] libvirt: Add setuid permission to virt-login-shell
on 02/04/2020 He Zhe wrote:

> From: He Zhe <zhe.he@windriver.com>
> 
> virt-login-shell asks for setuid permission as follow.
> "virt-login-shell: must be run as setuid root"
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_6.1.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
> index 7b10920..9aa78b7 100644
> --- a/recipes-extended/libvirt/libvirt_6.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
> @@ -368,6 +368,9 @@ do_install_append() {
>  	    # Force the connection to be tls.
>  	    sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
>  	fi
> +
> +	# virt-login-shell needs to run with setuid permission
> +	chmod 4755 ${D}${bindir}/virt-login-shell
>  }
>  
>  EXTRA_OECONF += " \
> -- 
> 2.7.4
> 

> 


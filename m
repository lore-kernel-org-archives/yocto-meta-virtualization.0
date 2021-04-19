Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.1708.1618791162424909175
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 18 Apr 2021 17:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C+1+VRvE;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id f12so24948959qtf.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 18 Apr 2021 17:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qvKgADsIJ0XDzlXHC+zXjug0VIdJTqlPp/3ygU9u2sY=;
        b=C+1+VRvEDbcaXxRc7AiyV4ygnR3/YXoy1sBB/cyBi3DJG3Yc4mRJpLxvZfqC8g9D0P
         HTlEeze/FmU+SdJ4d2I5xTnEgKnhvYDxSXg10R8qcxVZ9D9cVvtaN/MNTf2kgoVQJDf7
         zbwZTpVgZoSBTTIkKJyZw3vVuRMF7IW3X19Mn9IJ7gFwGolqwf7S99+NO1CY5gF0FS1f
         WjlysZ3RH28tDAXWYuW14k4MLhUo71AK54xyVKebYq0E6Ip1WPdLS7Qpsv8WCmUtuGH8
         Dp2LXV3eJoRRjkeHXCFJCxXx3S974vrMq/JF98l5K1gK0R0obCvFJhGC7k9kVVYD+t19
         Z5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qvKgADsIJ0XDzlXHC+zXjug0VIdJTqlPp/3ygU9u2sY=;
        b=HDaGs+ug6Ce0iBQt1xMDz9PTzaYdFJy/ZDD584ukU3Xa+z5x5cCVCIGRbea99XYMW/
         EcmgERqZZ/T2UqRg9oPPhCbIqnbWsz2HJucAsI1QMsrHY21j/S9WEdaa5grAT5w7cW61
         wTxYI1YpXKAxzrIw08R/y4MyDyUXbDjJ3LbqzMzNC5J2KkgzP3ul1ct/IIEl3ilJkAzN
         No/WTZiiJnAEYKaCjECNJGbrraexjrJWqzIntgqPIUwQTl8pG05N9Wrqe2PZA/k04QXn
         vbn8j4uoLJ9xsnG88MqNz6rfszsqd6alqY4MFMsWsZO57NUoNc7OePCdTHWb3WTCCEcT
         u6iw==
X-Gm-Message-State: AOAM532hPnaLZj9W2qYPnOg8FDfYvO8B5gTdcpSfkalsOt1hQ/Ov88mX
	OwlbPmZGZac+NfLw6nJLwEQ=
X-Google-Smtp-Source: ABdhPJxfB+saXngGAi4AY8aO/AItlewtzeqJpu9BkZAUXeI583wcRd3fIZKFKp+6L6Xj6XBv9P2oYg==
X-Received: by 2002:ac8:4e36:: with SMTP id d22mr9398130qtw.102.1618791161261;
        Sun, 18 Apr 2021 17:12:41 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j15sm3458276qke.35.2021.04.18.17.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:12:40 -0700 (PDT)
Date: Sun, 18 Apr 2021 20:12:39 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2 1/2] busybox: Add nsenter for podman runtime
Message-ID: <20210419001236.GA61503@gmail.com>
References: <20210415083718.19954-1-nathan.dunne@arm.com>
 <10678.1618476931041116975@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <10678.1618476931041116975@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: Re: [meta-virtualization] [PATCH v2 1/2] busybox: Add nsenter for podman runtime
on 15/04/2021 Nathan Dunne wrote:

> Hi,
> 
> I've accidentally included the Issue-Id and Change-Id tags in v2 of these
> patches, can they be removed on merge or should I submit a v3?

I edited the patches are part of my normal flow and dropped the tracking
IDs.

But thanks for noticing and following up!

Bruce

> 
> Thanks,
> Nathan

> 
> 
> 


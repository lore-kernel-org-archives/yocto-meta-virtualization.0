Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF205E00CD8; Thu, 10 Jan 2019 10:10:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CFF0E00C4E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2019 10:10:37 -0800 (PST)
Received: by mail-lj1-f195.google.com with SMTP id s5-v6so10521025ljd.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2019 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aIdgtYRN6fv+AWDyqVsf+eDxfanK9tw+kFDVXgXSoDw=;
	b=AJEbMmCMI2NoOxLoTqWAMKh8PLW+J9/PJ8S7NhXvaDsEywW999vape6EVUKDxBTvqK
	h9MwTb/+2KtH0P71VOcx516jS8vlHRdgub0Il+w7fyGp3fqsNXxWm0sXWKGuNI8DkQOs
	TteCehUwhJxqtfPdMeBkwH+RH0VICTRO62AmDeFKXlo6+JI7OW9FmDddkTZ2msoAD9Y5
	FhdmWNy8DdLUbVXnkpQXsof1pUjfyNiXcIFwAkQkI0EEf3tUn4EEdVq9bboweS9X7WAt
	aqNeevU6c4thmdFeA09fqVkbL4zAlgB46wNLoOv/U+e0YCNOSZySHLN8UdZpizwBRi6P
	BMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aIdgtYRN6fv+AWDyqVsf+eDxfanK9tw+kFDVXgXSoDw=;
	b=n8GhJusA0tL3d6j8gNpPpBSyjDgZif5Fc3rpe1PxUqMaUk6wC9tXgD1fUHp/vPt7It
	oxGzJbhcXF9mQDwRCKp0xzaMQfrcPdMRFcvUqQaLz4be9aMIGi8PzLhB30SHWBq9OAjz
	XDQuXpiSLv1cT1dwmb0+rxf9f+pI9zwXxcdrN66fn87h7v8zI761CXNKkwR8/SUJBEjE
	U052Gzwc+P+CzW2XQpZvAnjK9Dmz76xrUgBdl2n9HGcbLEl0cENnJ74BaMeuVMIZ5Bhx
	Ctzb9VyvmCUAkfYaEePaiCLr7G87pcH149X5N5vYA5ghTEWrh9QukCJtDs77KP0Rc6Y1
	essw==
X-Gm-Message-State: AJcUukcacgmMSLMzd8J3vGmNHfMHMfdy0AOKD7bM0VYmbvU9JtiBtjsj
	KjmQGHjoKxFUMnrKM4eUsxWG8Sbp8L2bZ2DKXtYpdg==
X-Google-Smtp-Source: ALg8bN4gn3PNYBQsy7Wn0FHluHBGbXci4XeP5lVCrv8kn7/OgAH61QXRP69uezpxCHm8yH9JYEeZBq+ZZ7zVGBEa3Bw=
X-Received: by 2002:a2e:92:: with SMTP id e18-v6mr7277978lji.130.1547143836134;
	Thu, 10 Jan 2019 10:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20190108133424.24377-1-paul@betafive.co.uk>
In-Reply-To: <20190108133424.24377-1-paul@betafive.co.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Jan 2019 13:10:24 -0500
Message-ID: <CADkTA4MuYgTYR950NTger+oKfhuX3_e-OsC0Jk0c1pWW9u0B3A@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 0/1] netns fix for master & thud
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2019 18:10:37 -0000
Content-Type: text/plain; charset="UTF-8"

merged!

Bruce

On Tue, Jan 8, 2019 at 8:42 AM Paul Barker <paul@betafive.co.uk> wrote:
>
> This patch belongs on both master and thud and should apply to both without
> needing modification.
>
> I'll follow up with a netns update on master once I've got some outstanding
> issues resolved.
>
> Paul Barker (1):
>   netns: Use correct go toolchain
>
>  recipes-networking/netns/netns_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <maciej.pijanowski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E3A3E00C5D; Tue, 29 May 2018 01:13:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from cloudserver096301.home.pl (cloudserver096301.home.pl
	[79.96.179.35])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 116A0E00C59
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 01:13:02 -0700 (PDT)
Received: from 109241231046.gdansk.vectranet.pl (109.241.231.46) (HELO
	[192.168.3.103])
	by serwer1539010.home.pl (79.96.179.35) with SMTP (IdeaSmtpServer 0.83)
	id f814b2d09b297cb1; Tue, 29 May 2018 10:13:00 +0200
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: meta-virtualization@yoctoproject.org
References: <a14785ac-11ce-f8c5-7019-7d71da60377e@3mdeb.com>
Message-ID: <11f607ca-70a3-1be4-0f15-34871bdb0b7a@3mdeb.com>
Date: Tue, 29 May 2018 10:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a14785ac-11ce-f8c5-7019-7d71da60377e@3mdeb.com>
Subject: Re: lxc build error: undefined reference to `__pthread_unwind'
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
X-List-Received-Date: Tue, 29 May 2018 08:13:05 -0000
Content-Type: multipart/alternative;
	boundary="------------CDAF591D655D0D3D1D75341C"
Content-Language: en-US

--------------CDAF591D655D0D3D1D75341C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I think that part of the problem is that buliding static libraries is 
globally disabled. Such configure switch
is also passed to the lxc, but it is building the |init.lxc.static| 
despite that. I'm not sure whether it is a
desired behavior or not.

||


On 28.05.2018 09:05, Maciej Pijanowski wrote:
> Hello,
>
> I'm in the middle of upgrading my build from pyro to sumo and I am 
> facing following build error:
>
> https://hastebin.3mdeb.com/erecefusux.tex
>
> I am building for Intel i7 machine. I tried upgrading the recipe to 
> 2.1.1 and the same error appears.
>
> I'm unfamiliar with the lxc project so any hint pointing in the 
> correct direction is highly appreciated.
> My guess would be that the linking order matters there (this is static 
> build) and symbols from
> libpthread are not visible.
>

-- 
Maciej Pijanowski
Embedded Systems Engineer
http://3mdeb.com | @3mdeb_com


--------------CDAF591D655D0D3D1D75341C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I think that part of the problem is that buliding static
      libraries is globally disabled. Such configure switch<br>
      is also passed to the lxc, but it is building the  <code>init.lxc.static</code>
      despite that. I'm not sure whether it is a<br>
      desired behavior or not.<br>
    </p>
    <pre id="box" style="" class="hljs" tabindex="0"><code>

</code></pre>
    <br>
    <div class="moz-cite-prefix">On 28.05.2018 09:05, Maciej Pijanowski
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a14785ac-11ce-f8c5-7019-7d71da60377e@3mdeb.com">Hello,
      <br>
      <br>
      I'm in the middle of upgrading my build from pyro to sumo and I am
      facing following build error:
      <br>
      <br>
      <a class="moz-txt-link-freetext" href="https://hastebin.3mdeb.com/erecefusux.tex">https://hastebin.3mdeb.com/erecefusux.tex</a>
      <br>
      <br>
      I am building for Intel i7 machine. I tried upgrading the recipe
      to 2.1.1 and the same error appears.
      <br>
      <br>
      I'm unfamiliar with the lxc project so any hint pointing in the
      correct direction is highly appreciated.
      <br>
      My guess would be that the linking order matters there (this is
      static build) and symbols from
      <br>
      libpthread are not visible.
      <br>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Maciej Pijanowski
Embedded Systems Engineer
<a class="moz-txt-link-freetext" href="http://3mdeb.com">http://3mdeb.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------CDAF591D655D0D3D1D75341C--

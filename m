Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02FC8E00CC4; Tue, 26 Sep 2017 09:27:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.172 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.172 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D68AAE00C3A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Sep 2017 09:27:15 -0700 (PDT)
Received: by mail-pf0-f172.google.com with SMTP id g65so5775001pfe.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Sep 2017 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=VnPM5YcdsP/1JBY7oHmhZ8CFTolYLuLqdDdjOuZ1iBI=;
	b=SduTTy+TjKOLRpZoOkW6VYH057C7lYYWhlbO28qg1IvqUgJAM2pov6yZ++mjNuN5BA
	SEaEqMm8+xSWW8SVTtqrAwL3MToadFAOoERpZjrLqobCZ5PBToX7zUNktpZorLfJ2DiU
	8GcAK/GmT6SjkW4lxVEweqWGcfa7OscAiTJA04kFZfIgHgU3uFeIu0LBrFBXqAquBsgC
	JzTMoClW9FAIytqNL3+nO5eYtbZXyoblaWe66ob8ASHtid3YhvyAZJjMUbY/h3CIXgIp
	dIHaATbuO+dfbcEOt4yk8KzHyKeQ0M3vGlobnre3hSBgDeHLH6WSVRwj7YieaDLaab7a
	qS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=VnPM5YcdsP/1JBY7oHmhZ8CFTolYLuLqdDdjOuZ1iBI=;
	b=sW2Dht+1jYDkUiebCPQHAXJbYs2ZVD9ItrtJNU87/3ZSOeDkSu/UZSPsdx78kgT/DB
	wRbL4SQgnhAq4mlyJ1NY3rGcsZ4dZj4Osk+aOhnRZZohQ341uXTZKb1n28H0lxJVZ7Gp
	dStKB6vafuTBzSiXxLYRXlLyQhctajOBaaNkS+Pds2oI/hi58Gxtmm8n/zZ4ZjM9xxGy
	mI0GFTFX2N+K2A+ymSog46P1cKLBW0GbHyzCcVnB7fOILGcaIufoK/bekwSYNrcz3kCt
	3kz4m8SCFqxt5oVwazAsQHU6AvoB3Lw7HSVkM5h46IuUBOJtc4qA+5Zgwgvh7CUGIcOR
	k43Q==
X-Gm-Message-State: AHPjjUjHnND5toTMvT63x5jlx61/JrHeTPnQYFcvEdLi+UF09PqdNYa9
	l8b7dEPH5f8EUD3ICRc2DUZF+hH6gNA=
X-Google-Smtp-Source: AOwi7QBzjkcM+X6vtqj/1vFV99HnD1EFbckMYHz02sF2SGa9hl9YALPrKHalMqMGiCx/JGRS+odlsg==
X-Received: by 10.84.229.8 with SMTP id b8mr11392317plk.405.1506443234582;
	Tue, 26 Sep 2017 09:27:14 -0700 (PDT)
Received: from [10.22.11.244] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	s4sm15897554pgr.32.2017.09.26.09.27.12
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 09:27:13 -0700 (PDT)
To: meta-virtualization@yoctoproject.org
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
	<CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
	<CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
	<CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
	<CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
	<CADkTA4OBuR=WWsiHW1r07nboKUtPuZNQBR9dN_uPPfv5zfvBzA@mail.gmail.com>
	<CACrgodfeQFn5abG+ThP+gB2tZ0sM81x-CWwVd8C8d+pHCk0rYg@mail.gmail.com>
	<CADkTA4NvkQs3umNUU6FqoBKQmGqSJ_j4xGR-tgdiCxA=Za-joQ@mail.gmail.com>
From: akuster <akuster@mvista.com>
Message-ID: <0c47dde5-5375-2735-a06b-d186690799cb@mvista.com>
Date: Tue, 26 Sep 2017 09:27:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NvkQs3umNUU6FqoBKQmGqSJ_j4xGR-tgdiCxA=Za-joQ@mail.gmail.com>
Subject: Re: [meta-cloud-services] meta-cloud-services Dependencies
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
X-List-Received-Date: Tue, 26 Sep 2017 16:27:17 -0000
Content-Type: multipart/alternative;
	boundary="------------4DD8C10906CEDC91810020E5"
Content-Language: en-US

--------------4DD8C10906CEDC91810020E5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 09/26/2017 05:21 AM, Bruce Ashfield wrote:
>
>
> On Tue, Sep 26, 2017 at 12:45 AM, Lai Eddy <eddy.lai.tw@gmail.com
> <mailto:eddy.lai.tw@gmail.com>> wrote:
>
>     under the openembedded-core folder
>     only meta , meta-selftest , meta-skeleton 3 sub-folder found
>     no openembedded-core/meta-oe
>                                             meta-networking
>                                             meta-ruby
>

Meta-ruby has been removed from meta-openembedded


>                                             meta-python...
>
>
>
> I didn't say openembedded-core, it was meta-openembedded
>
> Bruce
>  
>
>
>     2017-09-26 8:47 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com
>     <mailto:bruce.ashfield@gmail.com>>:
>
>         On Mon, Sep 25, 2017 at 8:16 PM, Lai Eddy
>         <eddy.lai.tw@gmail.com <mailto:eddy.lai.tw@gmail.com>> wrote:
>         >
>         > Thanks Bruce,
>         >
>         > but I still don't understand,now I have following in my
>         bblayrs.conf
>         >
>         > BBLAYERS ?= " \
>         >   /home/user/poky/meta \
>         >   /home/user/poky/meta-poky \
>         >   /home/user/poky/meta-yocto-bsp \
>         >   /home/user/poky/openembedded-core/meta \
>         >   /home/user/poky/meta-cloud-services \
>         >   /home/user/poky/meta-cloud-services/meta-openstack \
>         >   /home/user/poky/meta-intel \
>         > "
>         > anything else I should add?
>
>
>         You do need more. The meta-openstack README states:
>
>         layers: meta-oe
>         meta-networking
>                 meta-ruby
>                 meta-filesystems
>                 meta-webserver
>                 meta-python
>
>
>         Which means:
>
>         meta-openembedded/meta-oe
>         meta-openembedded/meta-networking
>
>         ... etc
>
>         And as Paul just pointed out, you don't repeat poky/meta and
>         poky/open-embedded-core/meta,
>         since poky/meta is a combination of openembedded-core/meta and
>         some
>
>         other layers
>
>         Cheers,
>
>         Bruce
>
>
>         >
>         > 2017-09-26 8:07 GMT+08:00 Bruce Ashfield
>         <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>:
>         >>
>         >>
>         >>
>         >> On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy
>         <eddy.lai.tw@gmail.com <mailto:eddy.lai.tw@gmail.com>> wrote:
>         >>>
>         >>> after clone the oe-core:
>         git://git.openembedded.org/openembedded-core
>         <http://git.openembedded.org/openembedded-core>
>         >>> there are only 3 folder inside (meta, meta-selftest
>         meta-skeleton)
>         >>> seems meta-cloud-services need things like meta-networking
>         and meta-python
>         >>> where can I found them?
>         >>>
>         >>> (that's why I think the needed dependency is 
>         git://github.com/openembedded/meta-openembedded.git
>         <http://github.com/openembedded/meta-openembedded.git> )
>         >>
>         >>
>         >> They are sublayers of that repo, the single clone gets you
>         all the layers you need, but
>         >> you do need to add them to your bblayers.conf file as they
>         sit in the clone.
>         >>
>         >> Bruce
>         >>
>         >>>
>         >>>
>         >>> 2017-09-20 10:28 GMT+08:00 Bruce Ashfield
>         <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>:
>         >>>>
>         >>>>
>         >>>>
>         >>>> On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield
>         <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>
>         wrote:
>         >>>>>
>         >>>>> Clearly the README is out of date (and wrong).
>         >>>>>
>         >>>>> That should be oe-core:
>         git://git.openembedded.org/openembedded-core
>         <http://git.openembedded.org/openembedded-core>
>         >>>>>
>         >>>>> Plus that isn't nearly the only layer dependency
>         >>>>>
>         >>>>> I'll have a look at what has gone wrong and update the
>         README.
>         >>>>
>         >>>>
>         >>>> I pushed a fix for the meta-cloud-services/README, which
>         is mostly empty since the
>         >>>> majority of the packages are actually in the
>         meta-openstack sublayer.  That layer had
>         >>>> the same issue with the layer references, so I fixed it
>         as well.
>         >>>>
>         >>>> Cheers,
>         >>>>
>         >>>> Bruce
>         >>>>
>         >>>>>
>         >>>>>
>         >>>>> Bruce
>         >>>>>
>         >>>>> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy
>         <eddy.lai.tw@gmail.com <mailto:eddy.lai.tw@gmail.com>> wrote:
>         >>>>>>
>         >>>>>> according to layer README
>         >>>>>>
>         http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
>         <http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/>
>         >>>>>> it said
>         >>>>>>
>         >>>>>> This layer depends on:
>         >>>>>>
>         >>>>>> URI: git://github.com/openembedded/oe-core.git
>         <http://github.com/openembedded/oe-core.git>
>         >>>>>>
>         >>>>>> but seems failed to clone from that URL
>         >>>>>> should that be
>         >>>>>> git://github.com/openembedded/meta-openembedded.git
>         <http://github.com/openembedded/meta-openembedded.git>
>         >>>>>> or other repo available?
>         >>>>>>
>         >>>>>>
>         >>>>>> --
>         >>>>>> _______________________________________________
>         >>>>>> meta-virtualization mailing list
>         >>>>>> meta-virtualization@yoctoproject.org
>         <mailto:meta-virtualization@yoctoproject.org>
>         >>>>>>
>         https://lists.yoctoproject.org/listinfo/meta-virtualization
>         <https://lists.yoctoproject.org/listinfo/meta-virtualization>
>         >>>>>>
>         >>>>>
>         >>>>>
>         >>>>>
>         >>>>> --
>         >>>>> "Thou shalt not follow the NULL pointer, for chaos and
>         madness await thee at its end"
>         >>>>
>         >>>>
>         >>>>
>         >>>>
>         >>>> --
>         >>>> "Thou shalt not follow the NULL pointer, for chaos and
>         madness await thee at its end"
>         >>>
>         >>>
>         >>
>         >>
>         >>
>         >> --
>         >> "Thou shalt not follow the NULL pointer, for chaos and
>         madness await thee at its end"
>         >
>         >
>
>
>
>         --
>         "Thou shalt not follow the NULL pointer, for chaos and madness
>         await
>         thee at its end"
>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
>


--------------4DD8C10906CEDC91810020E5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 09/26/2017 05:21 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NvkQs3umNUU6FqoBKQmGqSJ_j4xGR-tgdiCxA=Za-joQ@mail.gmail.com">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Sep 26, 2017 at 12:45 AM, Lai
            Eddy <span dir="ltr">&lt;<a
                href="mailto:eddy.lai.tw@gmail.com" target="_blank"
                moz-do-not-send="true">eddy.lai.tw@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div dir="ltr">under the openembedded-core folder
                <div>only meta , meta-selftest , meta-skeleton 3
                  sub-folder found</div>
                <div>no openembedded-core/meta-oe</div>
                <div>                                       
                  meta-networking</div>
                <div>                                        meta-ruby</div>
              </div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Meta-ruby has been removed from meta-openembedded<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4NvkQs3umNUU6FqoBKQmGqSJ_j4xGR-tgdiCxA=Za-joQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div dir="ltr">
                <div>                                       
                  meta-python...<br>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>I didn't say openembedded-core, it
              was meta-openembedded</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div dir="ltr">
                <div>
                  <div class="gmail_extra"><br>
                    <div class="gmail_quote"><span class="gmail-">2017-09-26
                        8:47 GMT+08:00 Bruce Ashfield <span dir="ltr">&lt;<a
                            href="mailto:bruce.ashfield@gmail.com"
                            target="_blank" moz-do-not-send="true">bruce.ashfield@gmail.com</a>&gt;</span>:<br>
                      </span>
                      <blockquote class="gmail_quote" style="margin:0px
                        0px 0px 0.8ex;border-left:1px solid
                        rgb(204,204,204);padding-left:1ex"><span
                          class="gmail-m_-4400102621140864493gmail-"><span
                            class="gmail-">On Mon, Sep 25, 2017 at 8:16
                            PM, Lai Eddy &lt;<a
                              href="mailto:eddy.lai.tw@gmail.com"
                              target="_blank" moz-do-not-send="true">eddy.lai.tw@gmail.com</a>&gt;
                            wrote:<br>
                            &gt;<br>
                            &gt; Thanks Bruce,<br>
                            &gt;<br>
                            &gt; but I still don't understand,now I have
                            following in my bblayrs.conf<br>
                            &gt;<br>
                            &gt; BBLAYERS ?= " \<br>
                            &gt;   /home/user/poky/meta \<br>
                            &gt;   /home/user/poky/meta-poky \<br>
                            &gt;   /home/user/poky/meta-yocto-<wbr>bsp \<br>
                          </span>
                          &gt;   /home/user/poky/openembedded-<wbr>core/meta
                          \<span class="gmail-"><br>
                            &gt;   /home/user/poky/meta-cloud-se<wbr>rvices
                            \<br>
                            &gt;   /home/user/poky/meta-cloud-se<wbr>rvices/meta-openstack
                            \<br>
                            &gt;   /home/user/poky/meta-intel \<br>
                            &gt; "<br>
                            &gt; anything else I should add?<br>
                            <br>
                            <br>
                          </span></span><span class="gmail-">You do need
                          more. The meta-openstack README states:<br>
                          <br>
                          layers: meta-oe<br>
                          meta-networking<br>
                                  meta-ruby<br>
                                  meta-filesystems<br>
                                  meta-webserver<br>
                                  meta-python<br>
                          <br>
                          <br>
                          Which means:<br>
                          <br>
                          meta-openembedded/meta-oe<br>
                          meta-openembedded/meta-network<wbr>ing<br>
                          <br>
                          ... etc<br>
                          <br>
                          And as Paul just pointed out, you don't repeat
                          poky/meta and<br>
                          poky/open-embedded-core/meta,<br>
                        </span>
                        since poky/meta is a combination of
                        openembedded-core/meta and some
                        <div>
                          <div class="gmail-h5"><br>
                            other layers<br>
                            <br>
                            Cheers,<br>
                            <br>
                            Bruce<br>
                            <div
                              class="gmail-m_-4400102621140864493gmail-HOEnZb">
                              <div
                                class="gmail-m_-4400102621140864493gmail-h5"><br>
                                <br>
                                &gt;<br>
                                &gt; 2017-09-26 8:07 GMT+08:00 Bruce
                                Ashfield &lt;<a
                                  href="mailto:bruce.ashfield@gmail.com"
                                  target="_blank" moz-do-not-send="true">bruce.ashfield@gmail.com</a>&gt;:<br>
                                &gt;&gt;<br>
                                &gt;&gt;<br>
                                &gt;&gt;<br>
                                &gt;&gt; On Mon, Sep 25, 2017 at 5:26
                                PM, Lai Eddy &lt;<a
                                  href="mailto:eddy.lai.tw@gmail.com"
                                  target="_blank" moz-do-not-send="true">eddy.lai.tw@gmail.com</a>&gt;
                                wrote:<br>
                                &gt;&gt;&gt;<br>
                                &gt;&gt;&gt; after clone the oe-core:
                                git://<a
                                  href="http://git.openembedded.org/openembedded-core"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">git.openembedded.org/ope<wbr>nembedded-core</a><br>
                                &gt;&gt;&gt; there are only 3 folder
                                inside (meta, meta-selftest
                                meta-skeleton)<br>
                                &gt;&gt;&gt; seems meta-cloud-services
                                need things like meta-networking and
                                meta-python<br>
                                &gt;&gt;&gt; where can I found them?<br>
                                &gt;&gt;&gt;<br>
                                &gt;&gt;&gt; (that's why I think the
                                needed dependency is  git://<a
                                  href="http://github.com/openembedded/meta-openembedded.git"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">github.com/openembedded/<wbr>meta-openembedded.git</a>
                                )<br>
                                &gt;&gt;<br>
                                &gt;&gt;<br>
                                &gt;&gt; They are sublayers of that
                                repo, the single clone gets you all the
                                layers you need, but<br>
                                &gt;&gt; you do need to add them to your
                                bblayers.conf file as they sit in the
                                clone.<br>
                                &gt;&gt;<br>
                                &gt;&gt; Bruce<br>
                                &gt;&gt;<br>
                                &gt;&gt;&gt;<br>
                                &gt;&gt;&gt;<br>
                                &gt;&gt;&gt; 2017-09-20 10:28 GMT+08:00
                                Bruce Ashfield &lt;<a
                                  href="mailto:bruce.ashfield@gmail.com"
                                  target="_blank" moz-do-not-send="true">bruce.ashfield@gmail.com</a>&gt;:<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt; On Tue, Sep 19, 2017 at
                                10:15 PM, Bruce Ashfield &lt;<a
                                  href="mailto:bruce.ashfield@gmail.com"
                                  target="_blank" moz-do-not-send="true">bruce.ashfield@gmail.com</a>&gt;
                                wrote:<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt; Clearly the README
                                is out of date (and wrong).<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt; That should be
                                oe-core: git://<a
                                  href="http://git.openembedded.org/openembedded-core"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">git.openembedded.org/ope<wbr>nembedded-core</a><br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt; Plus that isn't
                                nearly the only layer dependency<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt; I'll have a look at
                                what has gone wrong and update the
                                README.<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt; I pushed a fix for the
                                meta-cloud-services/README, which is
                                mostly empty since the<br>
                                &gt;&gt;&gt;&gt; majority of the
                                packages are actually in the
                                meta-openstack sublayer.  That layer had<br>
                                &gt;&gt;&gt;&gt; the same issue with the
                                layer references, so I fixed it as well.<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt; Cheers,<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt; Bruce<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt; Bruce<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt; On Tue, Sep 19,
                                2017 at 8:23 PM, Lai Eddy &lt;<a
                                  href="mailto:eddy.lai.tw@gmail.com"
                                  target="_blank" moz-do-not-send="true">eddy.lai.tw@gmail.com</a>&gt;
                                wrote:<br>
                                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; according to
                                layer README<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; <a
href="http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">http://git.yoctoproject.org/cg<wbr>it/cgit.cgi/meta-cloud-service<wbr>s/about/</a><br>
                                &gt;&gt;&gt;&gt;&gt;&gt; it said<br>
                                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; This layer
                                depends on:<br>
                                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; URI: git://<a
                                  href="http://github.com/openembedded/oe-core.git"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">github.com/openembedded/<wbr>oe-core.git</a><br>
                                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; but seems
                                failed to clone from that URL<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; should that be<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; git://<a
                                  href="http://github.com/openembedded/meta-openembedded.git"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">github.com/openembedded/<wbr>meta-openembedded.git</a><br>
                                &gt;&gt;&gt;&gt;&gt;&gt; or other repo
                                available?<br>
                                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; --<br>
                                &gt;&gt;&gt;&gt;&gt;&gt;
                                ______________________________<wbr>_________________<br>
                                &gt;&gt;&gt;&gt;&gt;&gt;
                                meta-virtualization mailing list<br>
                                &gt;&gt;&gt;&gt;&gt;&gt; <a
                                  href="mailto:meta-virtualization@yoctoproject.org"
                                  target="_blank" moz-do-not-send="true">meta-virtualization@yoctoproje<wbr>ct.org</a><br>
                                &gt;&gt;&gt;&gt;&gt;&gt; <a
                                  href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">https://lists.yoctoproject.org<wbr>/listinfo/meta-virtualization</a><br>
                                &gt;&gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;&gt; --<br>
                                &gt;&gt;&gt;&gt;&gt; "Thou shalt not
                                follow the NULL pointer, for chaos and
                                madness await thee at its end"<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt;<br>
                                &gt;&gt;&gt;&gt; --<br>
                                &gt;&gt;&gt;&gt; "Thou shalt not follow
                                the NULL pointer, for chaos and madness
                                await thee at its end"<br>
                                &gt;&gt;&gt;<br>
                                &gt;&gt;&gt;<br>
                                &gt;&gt;<br>
                                &gt;&gt;<br>
                                &gt;&gt;<br>
                                &gt;&gt; --<br>
                                &gt;&gt; "Thou shalt not follow the NULL
                                pointer, for chaos and madness await
                                thee at its end"<br>
                                &gt;<br>
                                &gt;<br>
                                <br>
                                <br>
                                <br>
                                --<br>
                                "Thou shalt not follow the NULL pointer,
                                for chaos and madness await<br>
                                thee at its end"<br>
                              </div>
                            </div>
                          </div>
                        </div>
                      </blockquote>
                    </div>
                    <br>
                  </div>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature">"Thou shalt not follow the NULL
            pointer, for chaos and madness await thee at its end"</div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------4DD8C10906CEDC91810020E5--

Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4852AC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 10:07:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.15947.1745921264388713854
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 03:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MvN7e7uN;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c30d9085aso4243330f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Apr 2025 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745921263; x=1746526063; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKEv/B4lTRy/Dz8gvUfMQ1DP4ajypbWLbYHl7QFqtbQ=;
        b=MvN7e7uN1fWF5LB3DG0XAI9kNdeDfjjzSSxc7rHPaWjDM5XZ5SY+SVyNkVCz7e7ikw
         zP9cwasHJMDRXqSz9zQfjtet33tQREoYdpOxk6wGSl/SvOh5CvBqIE2b8GpBhiLoQz62
         ibRcJhmh1bfFWzS+V6lM3mv8QZGYrM+4/MKS1Vg0I5Y/ud/tgdjRML24NSZgeMi+4jq/
         wBDsAO6BXx2Xh4kwpif05AdW5AhMC0pF6+q3MdsYFA9z1vT9xcLxAsGewtEKoDwXabQH
         AOscW8NFbSS2CGAk4TMVQKnQATyGi4fZcdMo7E7VhXaYKBZoqx3n4pVfaMpZDN405nI0
         vmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921263; x=1746526063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKEv/B4lTRy/Dz8gvUfMQ1DP4ajypbWLbYHl7QFqtbQ=;
        b=BGKKtE0nI5z5fXA4qsN3xHGddLMBTRVHgic1pEGpn6j8IHmFWDyVC6UqE61ssM7tXq
         oJgRxb8Ku9+OSJRhLXxG+9XtDboI39HgadRvQn033jiLA/Dr7/TXLpvvmpH08mvqDKQo
         rSdMwes6pSJ7dfDbwTMjIcW3kNKXFTvOOA119Msun07qrZsIG8W6uRegvv1pdD11KGFX
         8IBxdNXoaUPniP5l46OOxEF7t3n1w+xZCrbVGO1h9jQaSvTiQ7dWhc9GhA5NItxiOa27
         0skHX6uSEwRc72zrgacFX7R400uFdFLGeoOaiK0UKI12IDFqv57gzRhPVL7ujO+peDNe
         WzaQ==
X-Gm-Message-State: AOJu0YwjeIVdCEEHaTp48tIPlptXRjU1IY9XchcteoqKQikUz99ehKJJ
	iy9IcoWif34Z93L/rW4mK0zE4s4iAFLK5SZCImQslMDZbKmJ/h0+2WcZs+uI
X-Gm-Gg: ASbGncvodJkuACALJ49DcLwc2XXXtQ6SoIXjmPMOOWB9BWueXf3R0+Zgiv7x+tFSnMq
	qA/UZxWe8HVZZTLYjuJU/yYOMBxKQhTn2pjg3EOLYeGG+8CexYP1j9oq/nzo785NdtkxGSYvEGt
	BGwA3JEkHhG6DdOefRx4f/lVHwnjfFHn+34GFRB6ApKv6eTNZcS2hNcBc6OVwSHw57FU/gtahms
	Z+aP+/OIQnFXr2gZbwTpo3C4t15HgnluN8qUcloUhRrem8vaBICSYh0t6UVptr3hSxAHooZG9Nv
	seqKCiPZFqzSpfYJyzvpeJrfA8qBGtHuEarUkTkgOb8=
X-Google-Smtp-Source: AGHT+IFotEwNcnbpqoC8aZPxLZTQmHIV2z28BjdeprwAOjldeNNvJvi0d9XmYI+GQLq9M9Y3yD6enQ==
X-Received: by 2002:a05:6000:4021:b0:39f:601:85fb with SMTP id ffacd0b85a97d-3a07aa5a768mr8570491f8f.2.1745921262592;
        Tue, 29 Apr 2025 03:07:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cbf030sm13445300f8f.46.2025.04.29.03.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:07:42 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/3] irqbalance: fix build with gcc-15
Date: Tue, 29 Apr 2025 12:07:33 +0200
Message-ID: <20250429100734.1440305-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429100734.1440305-1-martin.jansa@gmail.com>
References: <20250429100734.1440305-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Apr 2025 10:07:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9238

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/853261/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...01-add-void-to-fix-strict-prototypes.patch | 298 ++++++++++++++++++
 recipes-extended/irqbalance/irqbalance_git.bb |   1 +
 2 files changed, 299 insertions(+)
 create mode 100644 recipes-extended/irqbalance/irqbalance/0001-add-void-to-fix-strict-prototypes.patch

diff --git a/recipes-extended/irqbalance/irqbalance/0001-add-void-to-fix-strict-prototypes.patch b/recipes-extended/irqbalance/irqbalance/0001-add-void-to-fix-strict-prototypes.patch
new file mode 100644
index 00000000..f40d6897
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance/0001-add-void-to-fix-strict-prototypes.patch
@@ -0,0 +1,298 @@
+From c25dfc295df789ceb1ed890ab7e5a9694503d829 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Sun, 31 Mar 2024 14:31:22 -0700
+Subject: [PATCH] add void to fix strict-prototypes
+
+This becomes a hard error with C23
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Upstream-Status: Backport [https://github.com/Irqbalance/irqbalance/commit/b6a831d692ed7e12db7748db49b3b39516d151d2]
+---
+ irqbalance.c       |  2 +-
+ irqbalance.h       |  2 +-
+ procinterrupts.c   |  2 +-
+ ui/helpers.c       |  2 +-
+ ui/helpers.h       |  2 +-
+ ui/irqbalance-ui.c |  4 ++--
+ ui/irqbalance-ui.h |  5 ++---
+ ui/ui.c            | 24 ++++++++++++------------
+ ui/ui.h            | 26 +++++++++++++-------------
+ 9 files changed, 34 insertions(+), 35 deletions(-)
+
+diff --git a/irqbalance.c b/irqbalance.c
+index e8d9ba9..d7b4184 100644
+--- a/irqbalance.c
++++ b/irqbalance.c
+@@ -554,7 +554,7 @@ out:
+ 	return TRUE;
+ }
+ 
+-int init_socket()
++int init_socket(void)
+ {
+ 	struct sockaddr_un addr;
+ 	memset(&addr, 0, sizeof(struct sockaddr_un));
+diff --git a/irqbalance.h b/irqbalance.h
+index e7f6b94..96ee07a 100644
+--- a/irqbalance.h
++++ b/irqbalance.h
+@@ -36,7 +36,7 @@ extern char *classes[];
+ extern void parse_cpu_tree(void);
+ extern void clear_work_stats(void);
+ extern void parse_proc_interrupts(void);
+-extern GList* collect_full_irq_list();
++extern GList* collect_full_irq_list(void);
+ extern void parse_proc_stat(void);
+ extern void set_interrupt_count(int number, uint64_t count);
+ extern void set_msi_interrupt_numa(int number);
+diff --git a/procinterrupts.c b/procinterrupts.c
+index 9015177..938cfad 100644
+--- a/procinterrupts.c
++++ b/procinterrupts.c
+@@ -204,7 +204,7 @@ void init_irq_class_and_type(char *savedline, struct irq_info *info, int irq)
+ 	info->name = strdup(irq_fullname);
+ }
+ 
+-GList* collect_full_irq_list()
++GList* collect_full_irq_list(void)
+ {
+ 	GList *tmp_list = NULL;
+ 	FILE *file;
+diff --git a/ui/helpers.c b/ui/helpers.c
+index 5d71275..14861cb 100644
+--- a/ui/helpers.c
++++ b/ui/helpers.c
+@@ -163,7 +163,7 @@ void dump_node(cpu_node_t *node, void *data __attribute__((unused)))
+ 	}
+ }
+ 
+-void dump_tree()
++void dump_tree(void)
+ {
+ 	for_each_node(tree, dump_node, NULL);
+ }
+diff --git a/ui/helpers.h b/ui/helpers.h
+index b8d9fcc..922914b 100644
+--- a/ui/helpers.h
++++ b/ui/helpers.h
+@@ -25,7 +25,7 @@ void for_each_node(GList *list, void (*fp)(cpu_node_t *node, void *data), void *
+ 
+ void dump_irq(irq_t *irq, void *data __attribute__((unused)));
+ void dump_node(cpu_node_t *node, void *data __attribute__((unused)));
+-void dump_tree();
++void dump_tree(void);
+ 
+ 
+ #endif /* HELPERS_H */
+diff --git a/ui/irqbalance-ui.c b/ui/irqbalance-ui.c
+index 3ad3553..132bb45 100644
+--- a/ui/irqbalance-ui.c
++++ b/ui/irqbalance-ui.c
+@@ -23,7 +23,7 @@ GMainLoop *main_loop;
+ int is_tree = 1;
+ static int default_bufsz = 8192;
+ 
+-struct msghdr * create_credentials_msg()
++struct msghdr * create_credentials_msg(void)
+ {
+ 	struct ucred *credentials = malloc(sizeof(struct ucred));
+ 	credentials->pid = getpid();
+@@ -46,7 +46,7 @@ struct msghdr * create_credentials_msg()
+ 	return msg;
+ }
+ 
+-int init_connection()
++int init_connection(void)
+ {
+ 	struct sockaddr_un addr;
+ 	memset(&addr, 0, sizeof(struct sockaddr_un));
+diff --git a/ui/irqbalance-ui.h b/ui/irqbalance-ui.h
+index fba7e7c..e9f6114 100644
+--- a/ui/irqbalance-ui.h
++++ b/ui/irqbalance-ui.h
+@@ -70,8 +70,8 @@ typedef struct setup {
+ 
+ /* Function prototypes */
+ 
+-struct msghdr * create_credentials_msg();
+-int init_connection();
++struct msghdr * create_credentials_msg(void);
++int init_connection(void);
+ void send_settings(char *data);
+ char * get_data(char *string);
+ void parse_setup(char *setup_data);
+@@ -81,7 +81,6 @@ void assign_cpu_lists(cpu_node_t *node, void *data);
+ void assign_cpu_mask(cpu_node_t *node, void *data);
+ void parse_into_tree(char *data);
+ gboolean rescan_tree(gpointer data);
+-int main();
+ 
+ 
+ #endif /* IRQBALANCE_UI_H */
+diff --git a/ui/ui.c b/ui/ui.c
+index 6ff3305..bc1d743 100644
+--- a/ui/ui.c
++++ b/ui/ui.c
+@@ -17,7 +17,7 @@ char *IRQ_CLASS_TO_STR[] = {
+ 			"10-Gigabit Ethernet",
+ 			"Virt Event"};
+ 
+-void show_frame()
++void show_frame(void)
+ {
+ 	int i;
+ 	attrset(COLOR_PAIR(4));
+@@ -33,7 +33,7 @@ void show_frame()
+ 	}
+ }
+ 
+-void show_footer()
++void show_footer(void)
+ {
+ 	char footer[COLS];
+ 	snprintf(footer, COLS - 1,
+@@ -149,7 +149,7 @@ void print_cpu_line(cpu_ban_t *cpu, void *data)
+ 	(*line_offset)++;
+ }
+ 
+-void print_all_cpus()
++void print_all_cpus(void)
+ {
+ 	if(all_cpus == NULL) {
+ 		for_each_node(tree, get_cpu, NULL);
+@@ -168,7 +168,7 @@ void add_banned_cpu(int *banned_cpu, void *data)
+ 	snprintf(data + strlen(data), 1024 - strlen(data), "%d, ", *banned_cpu);
+ }
+ 
+-void display_banned_cpus()
++void display_banned_cpus(void)
+ {
+ 	char banned_cpus[1024] = "Banned CPU numbers: \0";
+ 	if(g_list_length(setup.banned_cpus) > 0) {
+@@ -221,7 +221,7 @@ void get_cpu(cpu_node_t *node, void *data __attribute__((unused)))
+ 	}
+ }
+ 
+-void handle_cpu_banning()
++void handle_cpu_banning(void)
+ {
+ 	GList *tmp = g_list_copy_deep(all_cpus, copy_cpu_ban, NULL);
+ 	attrset(COLOR_PAIR(5));
+@@ -371,7 +371,7 @@ void print_irq_line(irq_t *irq, void *data)
+ 
+ }
+ 
+-void print_all_irqs()
++void print_all_irqs(void)
+ {
+ 	int *line = malloc(sizeof(int));
+ 	*line = 4;
+@@ -418,13 +418,13 @@ void copy_irqs_from_nodes(cpu_node_t *node, void *data __attribute__((unused)))
+ 	}
+ }
+ 
+-void get_all_irqs()
++void get_all_irqs(void)
+ {
+ 	all_irqs = g_list_copy_deep(setup.banned_irqs, copy_irq, NULL);
+ 	for_each_node(tree, copy_irqs_from_nodes, NULL);
+ }
+ 
+-void handle_irq_banning()
++void handle_irq_banning(void)
+ {
+ 	GList *tmp = g_list_copy_deep(all_irqs, copy_irq, NULL);
+ 	attrset(COLOR_PAIR(5));
+@@ -520,7 +520,7 @@ void handle_irq_banning()
+ 	}
+ }
+ 
+-void init()
++void init(void)
+ {
+ 	signal(SIGINT, close_window);
+ 	initscr();
+@@ -556,7 +556,7 @@ void close_window(int sig __attribute__((unused)))
+ 	exit(EXIT_SUCCESS);
+ }
+ 
+-void settings()
++void settings(void)
+ {
+ 	clear();
+ 	char *setup_data = get_data(SETUP);
+@@ -620,7 +620,7 @@ void settings()
+ 	free(setup_data);
+ }
+ 
+-void setup_irqs()
++void setup_irqs(void)
+ {
+ 	clear();
+ 	get_all_irqs();
+@@ -720,7 +720,7 @@ void display_tree_node(cpu_node_t *node, void *data)
+ 	}
+ }
+ 
+-void display_tree()
++void display_tree(void)
+ {
+ 	clear();
+ 	char *setup_data = get_data(SETUP);
+diff --git a/ui/ui.h b/ui/ui.h
+index 0aa8280..bb017e9 100644
+--- a/ui/ui.h
++++ b/ui/ui.h
+@@ -15,39 +15,39 @@ extern GList *tree;
+ extern setup_t setup;
+ extern int is_tree;
+ 
+-void show_frame();
+-void show_footer();
++void show_frame(void);
++void show_footer(void);
+ 
+ char * check_control_in_sleep_input(int max_len, int column_offest, int line_offset);
+ int get_valid_sleep_input(int column_offest);
+ 
+ void get_banned_cpu(int *cpu, void *data);
+ void print_cpu_line(cpu_ban_t *cpu, void *data);
+-void print_all_cpus();
++void print_all_cpus(void);
+ void add_banned_cpu(int *banned_cpu, void *data);
+-void display_banned_cpus();
++void display_banned_cpus(void);
+ int toggle_cpu(GList *cpu_list, int cpu_number);
+ void get_new_cpu_ban_values(cpu_ban_t *cpu, void *data);
+-void get_cpu();
+-void handle_cpu_banning();
++void get_cpu(cpu_node_t *node, void *data);
++void handle_cpu_banning(void);
+ 
+ void copy_assigned_obj(int *number, void *data);
+ void print_assigned_objects_string(irq_t *irq, int *line_offset);
+ void print_irq_line(irq_t *irq, void *data);
+-void print_all_irqs();
++void print_all_irqs(void);
+ int toggle_irq(GList *irq_list, int position);
+ void get_new_irq_ban_values(irq_t *irq, void *data);
+ void copy_irqs_from_nodes(cpu_node_t *node, void *data);
+-void get_all_irqs();
+-void handle_irq_banning();
++void get_all_irqs(void);
++void handle_irq_banning(void);
+ 
+-void init();
++void init(void);
+ void close_window(int sig);
+-void settings();
+-void setup_irqs();
++void settings(void);
++void setup_irqs(void);
+ void display_tree_node_irqs(irq_t *irq, void *data);
+ void display_tree_node(cpu_node_t *node, void *data);
+-void display_tree();
++void display_tree(void);
+ 
+ 
+ #endif /* UI_H */
diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
index aa7f0de9..068cf12e 100644
--- a/recipes-extended/irqbalance/irqbalance_git.bb
+++ b/recipes-extended/irqbalance/irqbalance_git.bb
@@ -10,6 +10,7 @@ PV = "1.8.0+git"
 SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
+           file://0001-add-void-to-fix-strict-prototypes.patch \
           "
 
 S = "${WORKDIR}/git"


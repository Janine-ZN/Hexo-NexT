<!DOCTYPE html>

{# NexT version #}
{% set version = next_env('version') %}

{# Language & Config #}
{% set title = __('title') !== 'title' && __('title') || config.title %}
{% set subtitle = __('subtitle') !== 'subtitle' && __('subtitle') || config.subtitle %}
{% set author = __('author') !== 'author' && __('author') || config.author %}
{% set description = __('description') !== 'description' && __('description') || config.description %}

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}
  {% if theme.canvas_nest %}
  <script type="text/javascript" src="//cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js"></script>
  {% endif %}
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">

  {% set container_class = 'container' %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + ' sidebar-position-' + theme.sidebar.position %}
  {% endif %}

  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <div class="headband">
	<a href="https://github.com/Janine-ZN">
		<img width="149" height="149" style="position: absolute; top: 0; right: 0; border: 0;" src="https://github.blog/wp-content/uploads/2008/12/forkme_right_red_aa0000.png?resize=149%2C149" class="attachment-full size-full" alt="Fork me on GitHub" data-recalc-dims="1">
	</a>
	</div>

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner">{% include '_partials/header/index.swig' %}</div>
    </header>

    {{ partial('_partials/github-banner.swig', {}, {cache: theme.cache.enable}) }}

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          {% if theme.scheme === 'Pisces' || theme.scheme === 'Gemini' %}
            {% include '_partials/header/sub-menu.swig' %}
          {% endif %}
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-inner">
        {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
        {% include '_third-party/analytics/analytics-with-widget.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {% if theme.back2top.enable and not theme.back2top.sidebar %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {% if theme.back2top.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {% endif %}
      </div>
    {% endif %}

    {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
      <div id="needsharebutton-float">
        <span class="btn">
          <i class="fa fa-share-alt" aria-hidden="true"></i>
        </span>
      </div>
    {% endif %}

    {% if theme.baidushare and theme.baidushare.type === "slide" %}
      <div>
        {% include '_partials/share/baidushare.swig' %}
      </div>
    {% endif %}

    {% if theme.add_this_id %}
      <div>
        {% include '_partials/share/add-this.swig' %}
      </div>
    {% endif %}
  </div>

  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}

  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/next-boot.swig' %}
  {% include '_scripts/scroll-cookie.swig' %}
  {% include '_scripts/exturl.swig' %}
  {% include '_third-party/quicklink.swig' %}
  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/analytics/firestore.swig' %}
  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/pdf.swig' %}
  {% include '_third-party/mermaid.swig' %}
  {% include '_third-party/baidu-push.swig' %}
  {% include '_third-party/schedule.swig' %}
  {% include '_third-party/needsharebutton.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/pangu.swig' %}
  {% include '_third-party/bookmark.swig' %}
  {% include '_third-party/copy-code.swig' %}
  {% include '_third-party/chatra.swig' %}
  {% include '_third-party/tidio.swig' %}
</body>
</html>

import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/acesso_operador_widget.dart';
import '/components/app_bar_widget.dart';
import '/components/menu_latera_menor_widget.dart';
import '/components/menu_lateral_maior_widget.dart';
import '/components/popup_criar_setor_widget.dart';
import '/components/popup_editar_setor_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bot_model.dart';
export 'bot_model.dart';

class BotWidget extends StatefulWidget {
  const BotWidget({super.key});

  @override
  State<BotWidget> createState() => _BotWidgetState();
}

class _BotWidgetState extends State<BotWidget> with TickerProviderStateMixin {
  late BotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if (true) {
          _model.apiResultdj273 =
              await SelectDataGroup.selectColabUserCall.call(
            authId: currentUserUid,
          );

          if ((_model.apiResultdj273?.succeeded ?? true)) {
            FFAppState().colabUser = ColabUserStruct(
              refEmpresa: SelectDataGroup.selectColabUserCall.idEmpresa(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              nomeEmpresa: SelectDataGroup.selectColabUserCall.empreNome(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              nome: SelectDataGroup.selectColabUserCall.nome(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              idSetor: SelectDataGroup.selectColabUserCall.setorid(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              email: currentUserEmail,
              tipo: SelectDataGroup.selectColabUserCall.tipo(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              id: SelectDataGroup.selectColabUserCall.id(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              genero: SelectDataGroup.selectColabUserCall.genero(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              foto: SelectDataGroup.selectColabUserCall.foto(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              dataNascimento:
                  SelectDataGroup.selectColabUserCall.dataNascimento(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              contato: SelectDataGroup.selectColabUserCall.contato(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
              ativo: SelectDataGroup.selectColabUserCall.ativo(
                (_model.apiResultdj273?.jsonBody ?? ''),
              ),
            );
            safeSetState(() {});
            _model.apiResult0v69 =
                await SelectDataGroup.conexaoSetoresUserCall.call(
              authID: currentUserUid,
            );

            if ((_model.apiResult0v69?.succeeded ?? true)) {
              FFAppState().setorConexao =
                  ((_model.apiResult0v69?.jsonBody ?? '')
                          .toList()
                          .map<SetoresConexaoStruct?>(
                              SetoresConexaoStruct.maybeFromMap)
                          .toList() as Iterable<SetoresConexaoStruct?>)
                      .withoutNulls
                      .toList()
                      .cast<SetoresConexaoStruct>();
              safeSetState(() {});
              if (!(FFAppState().colabUser.keyColabUser != null &&
                  FFAppState().colabUser.keyColabUser != '')) {
                FFAppState().updateColabUserStruct(
                  (e) => e
                    ..keyColabUser = FFAppState().setorConexao.first.keyConexao,
                );
                safeSetState(() {});
              }
            }
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Usuário não cadastrado'),
                  content: Text(
                      'parece que você não esta cadastrado na nossa plataforma, caso isso seja um erro, entre em contato com o SUPORTE.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );

            context.pushNamedAuth(
              'HomePage',
              context.mounted,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        }
        if (FFAppState().colabUser.ativo == false) {
          context.goNamedAuth(
            'HomePage',
            context.mounted,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          return;
        }
        if (FFAppState().colabUser.tipo == 'Operador') {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: AcessoOperadorWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
        _model.apiResultdhw = await SelectDataGroup.selectJsonSetorCall.call(
          refEmpresa: FFAppState().colabUser.refEmpresa,
        );

        if ((_model.apiResultdhw?.succeeded ?? true)) {
          FFAppState().setoresDT = ((_model.apiResultdhw?.jsonBody ?? '')
                  .toList()
                  .map<BotSetoresStruct?>(BotSetoresStruct.maybeFromMap)
                  .toList() as Iterable<BotSetoresStruct?>)
              .withoutNulls
              .toList()
              .cast<BotSetoresStruct>();
          safeSetState(() {});
        }
        _model.horarios = await actions.returnHorario(
          FFAppState().colabUser.refEmpresa,
        );
        FFAppState().disponibilidade = _model.horarios!;
        safeSetState(() {});
        if (FFAppState().setoresDT.length > 0) {
          await BotTable().update(
            data: {
              'setoresEscolhidos':
                  functions.setoresToJson(FFAppState().setoresDT.toList()),
            },
            matchingRows: (rows) => rows.eq(
              'id_empresa',
              FFAppState().colabUser.refEmpresa,
            ),
          );
          await actions.updateSetores(
            FFAppState().setoresDT.toList(),
          );
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('Setores vazios'),
                content: Text('Setores vazios'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        context.pushNamedAuth(
          'HomePage',
          context.mounted,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldassumirFocusNode ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textField9FocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-25.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(25.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-25.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(25.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-25.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(25.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-25.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(25.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-25.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(25.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'wrapOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'wrapOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'wrapOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'wrapOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'formOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Container(
          width: 230.0,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: wrapWithModel(
                model: _model.menuLateralMaiorModel,
                updateCallback: () => safeSetState(() {}),
                child: MenuLateralMaiorWidget(),
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F8F9),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 80.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        constraints: BoxConstraints(
                          minWidth: 80.0,
                          minHeight: MediaQuery.sizeOf(context).height * 1.0,
                          maxWidth: 250.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          border: Border.all(
                            color: Color(0x001A2437),
                          ),
                        ),
                        child: Stack(
                          children: [
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: wrapWithModel(
                                model: _model.menuLateraMenorModel,
                                updateCallback: () => safeSetState(() {}),
                                child: MenuLateraMenorWidget(),
                              ),
                              onEnter: ((event) async {
                                safeSetState(() => _model
                                    .mouseRegionMenuLateralHovered = true);
                                scaffoldKey.currentState!.openDrawer();
                              }),
                              onExit: ((event) async {
                                safeSetState(() => _model
                                    .mouseRegionMenuLateralHovered = false);
                              }),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.appBarModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AppBarWidget(),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 40.0, 20.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Configuração do BOT',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Nunito Sans'),
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                          ),
                                          FutureBuilder<List<BotRow>>(
                                            future: BotTable().querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id_empresa',
                                                FFAppState()
                                                    .colabUser
                                                    .refEmpresa,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BotRow>
                                                  containersingleRowBotRowList =
                                                  snapshot.data!;

                                              final containersingleRowBotRow =
                                                  containersingleRowBotRowList
                                                          .isNotEmpty
                                                      ? containersingleRowBotRowList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: FutureBuilder<
                                                    List<SetoresRow>>(
                                                  future:
                                                      SetoresTable().queryRows(
                                                    queryFn: (q) => q.eq(
                                                      'id_empresas',
                                                      FFAppState()
                                                          .colabUser
                                                          .refEmpresa,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<SetoresRow>
                                                        containersetoresSetoresRowList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Wrap(
                                                              spacing: 24.0,
                                                              runSpacing: 20.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                MouseRegion(
                                                                  opaque: false,
                                                                  cursor: MouseCursor
                                                                          .defer ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.paginas =
                                                                            'imagem';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Imagem',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: () {
                                                                                      if (_model.mouseRegionencerramentoHovered1 == true) {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if (_model.paginas == 'imagem') {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else {
                                                                                        return Color(0x80000000);
                                                                                      }
                                                                                    }(),
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (_model.paginas ==
                                                                              'imagem')
                                                                            Container(
                                                                              width: 90.0,
                                                                              height: 3.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!).animateOnActionTrigger(
                                                                                  animationsMap['containerOnActionTriggerAnimation1']!,
                                                                                ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onEnter:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered1 =
                                                                            true);
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered1 =
                                                                            false);
                                                                  }),
                                                                ),
                                                                MouseRegion(
                                                                  opaque: false,
                                                                  cursor: MouseCursor
                                                                          .defer ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        120.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.paginas =
                                                                            'mensagens';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Mensagens',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: () {
                                                                                      if (_model.mouseRegionencerramentoHovered2 == true) {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if (_model.paginas == 'mensagens') {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else {
                                                                                        return Color(0x80000000);
                                                                                      }
                                                                                    }(),
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (_model.paginas ==
                                                                              'mensagens')
                                                                            Container(
                                                                              width: 120.0,
                                                                              height: 3.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!).animateOnActionTrigger(
                                                                                  animationsMap['containerOnActionTriggerAnimation2']!,
                                                                                ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onEnter:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered2 =
                                                                            true);
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered2 =
                                                                            false);
                                                                  }),
                                                                ),
                                                                MouseRegion(
                                                                  opaque: false,
                                                                  cursor: MouseCursor
                                                                          .defer ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.paginas =
                                                                            'setores';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Setores',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: () {
                                                                                      if (_model.mouseRegionencerramentoHovered3 == true) {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if (_model.paginas == 'setores') {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else {
                                                                                        return Color(0x80000000);
                                                                                      }
                                                                                    }(),
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (_model.paginas ==
                                                                              'setores')
                                                                            Container(
                                                                              width: 90.0,
                                                                              height: 3.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!).animateOnActionTrigger(
                                                                                  animationsMap['containerOnActionTriggerAnimation3']!,
                                                                                ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onEnter:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered3 =
                                                                            true);
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered3 =
                                                                            false);
                                                                  }),
                                                                ),
                                                                MouseRegion(
                                                                  opaque: false,
                                                                  cursor: MouseCursor
                                                                          .defer ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.paginas =
                                                                            'horarios';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Horários',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: () {
                                                                                      if (_model.mouseRegionencerramentoHovered4 == true) {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if (_model.paginas == 'horarios') {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else {
                                                                                        return Color(0x80000000);
                                                                                      }
                                                                                    }(),
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (_model.paginas ==
                                                                              'horarios')
                                                                            Container(
                                                                              width: 100.0,
                                                                              height: 3.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation4']!).animateOnActionTrigger(
                                                                                  animationsMap['containerOnActionTriggerAnimation4']!,
                                                                                ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onEnter:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered4 =
                                                                            true);
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered4 =
                                                                            false);
                                                                  }),
                                                                ),
                                                                MouseRegion(
                                                                  opaque: false,
                                                                  cursor: MouseCursor
                                                                          .defer ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        140.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.paginas =
                                                                            'configuraçoes';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Configurações',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: () {
                                                                                      if (_model.mouseRegionencerramentoHovered5 == true) {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else if (_model.paginas == 'configuraçoes') {
                                                                                        return FlutterFlowTheme.of(context).primary;
                                                                                      } else {
                                                                                        return Color(0x80000000);
                                                                                      }
                                                                                    }(),
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          if (_model.paginas ==
                                                                              'configuraçoes')
                                                                            Container(
                                                                              width: 140.0,
                                                                              height: 3.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation5']!).animateOnActionTrigger(
                                                                                  animationsMap['containerOnActionTriggerAnimation5']!,
                                                                                ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onEnter:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered5 =
                                                                            true);
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    safeSetState(() =>
                                                                        _model.mouseRegionencerramentoHovered5 =
                                                                            false);
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        24.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (_model
                                                                        .paginas ==
                                                                    'imagem') {
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        AnimatedContainer(
                                                                          duration:
                                                                              Duration(milliseconds: 240),
                                                                          curve:
                                                                              Curves.easeInOut,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            minWidth:
                                                                                MediaQuery.sizeOf(context).width * 0.7,
                                                                            maxWidth:
                                                                                MediaQuery.sizeOf(context).width * 0.7,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                4.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 24.0),
                                                                              child: Wrap(
                                                                                spacing: 0.0,
                                                                                runSpacing: 0.0,
                                                                                alignment: WrapAlignment.spaceBetween,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Imagem automática do BOT',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Nunito Sans',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontSize: 24.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                              ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 320.0,
                                                                                          height: 1.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x6E9C9C9C),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                                          child: MouseRegion(
                                                                                            opaque: false,
                                                                                            cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                  context: context,
                                                                                                  allowPhoto: true,
                                                                                                );
                                                                                                if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                  safeSetState(() => _model.isDataUploading1 = true);
                                                                                                  var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                  try {
                                                                                                    selectedUploadedFiles = selectedMedia
                                                                                                        .map((m) => FFUploadedFile(
                                                                                                              name: m.storagePath.split('/').last,
                                                                                                              bytes: m.bytes,
                                                                                                              height: m.dimensions?.height,
                                                                                                              width: m.dimensions?.width,
                                                                                                              blurHash: m.blurHash,
                                                                                                            ))
                                                                                                        .toList();
                                                                                                  } finally {
                                                                                                    _model.isDataUploading1 = false;
                                                                                                  }
                                                                                                  if (selectedUploadedFiles.length == selectedMedia.length) {
                                                                                                    safeSetState(() {
                                                                                                      _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                                    });
                                                                                                  } else {
                                                                                                    safeSetState(() {});
                                                                                                    return;
                                                                                                  }
                                                                                                }
                                                                                              },
                                                                                              child: AnimatedContainer(
                                                                                                duration: Duration(milliseconds: 100),
                                                                                                curve: Curves.easeIn,
                                                                                                width: 320.0,
                                                                                                height: 280.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    _model.mouseRegionImagemHovered! ? Color(0xFFDEDEDE) : Color(0xFFF5F8F9),
                                                                                                    Color(0xFFF5F8F9),
                                                                                                  ),
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 4.0,
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        _model.mouseRegionImagemHovered! ? Color(0x33000000) : Color(0x00FFFFFF),
                                                                                                        Color(0x00FFFFFF),
                                                                                                      ),
                                                                                                      offset: Offset(
                                                                                                        0.0,
                                                                                                        2.0,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      _model.mouseRegionImagemHovered! ? FlutterFlowTheme.of(context).primaryText : Color(0x6E9C9C9C),
                                                                                                      Color(0x6E9C9C9C),
                                                                                                    ),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    if (_model.uploadedLocalFile1 == null || (_model.uploadedLocalFile1.bytes?.isEmpty ?? true))
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Escolha uma imagem',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    if (_model.uploadedLocalFile1 != null && (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false))
                                                                                                      Container(
                                                                                                        width: double.infinity,
                                                                                                        height: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xB4FFFFFF),
                                                                                                        ),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.memory(
                                                                                                            _model.uploadedLocalFile1.bytes ?? Uint8List.fromList([]),
                                                                                                            width: 300.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                            errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                              'assets/images/error_image.jpg',
                                                                                                              width: 300.0,
                                                                                                              height: 200.0,
                                                                                                              fit: BoxFit.contain,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            onEnter: ((event) async {
                                                                                              safeSetState(() => _model.mouseRegionImagemHovered = true);
                                                                                            }),
                                                                                            onExit: ((event) async {
                                                                                              safeSetState(() => _model.mouseRegionImagemHovered = false);
                                                                                            }),
                                                                                          ),
                                                                                        ),
                                                                                        if (_model.uploadedLocalFile1 != null && (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                safeSetState(() {
                                                                                                  _model.isDataUploading1 = false;
                                                                                                  _model.uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                });

                                                                                                safeSetState(() {
                                                                                                  _model.isDataUploading2 = false;
                                                                                                  _model.uploadedLocalFile2 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                                  _model.uploadedFileUrl2 = '';
                                                                                                });
                                                                                              },
                                                                                              text: 'Resetar imagem',
                                                                                              options: FFButtonOptions(
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 58.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 340.0,
                                                                                          height: 560.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                            border: Border.all(
                                                                                              width: 8.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Stack(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            children: [
                                                                                              ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: Image.asset(
                                                                                                  'assets/images/8c98994518b575bfd8c949e91d20548b.jpg',
                                                                                                  width: double.infinity,
                                                                                                  height: double.infinity,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 300.0,
                                                                                                      height: 200.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Card(
                                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                        color: Color(0xFFD9EAD3),
                                                                                                        elevation: 4.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            if (valueOrDefault<bool>(
                                                                                                              (containersingleRowBotRow?.imagem == null || containersingleRowBotRow?.imagem == '') && (_model.uploadedLocalFile1 == null || (_model.uploadedLocalFile1.bytes?.isEmpty ?? true)),
                                                                                                              true,
                                                                                                            ))
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/8c98994518b575bfd8c949e91d20548b.jpg',
                                                                                                                    width: 300.0,
                                                                                                                    height: 200.0,
                                                                                                                    fit: BoxFit.none,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (valueOrDefault<bool>(
                                                                                                              _model.uploadedLocalFile1 != null && (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false),
                                                                                                              false,
                                                                                                            ))
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.memory(
                                                                                                                    _model.uploadedLocalFile1.bytes ?? Uint8List.fromList([]),
                                                                                                                    width: 300.0,
                                                                                                                    height: 200.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                    errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                      'assets/images/error_image.jpg',
                                                                                                                      width: 300.0,
                                                                                                                      height: 200.0,
                                                                                                                      fit: BoxFit.cover,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            if (valueOrDefault<bool>(
                                                                                                              (containersingleRowBotRow?.imagem != null && containersingleRowBotRow?.imagem != '') && (_model.uploadedLocalFile1 == null || (_model.uploadedLocalFile1.bytes?.isEmpty ?? true)),
                                                                                                              false,
                                                                                                            ))
                                                                                                              Padding(
                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  child: Image.network(
                                                                                                                    containersingleRowBotRow!.imagem!,
                                                                                                                    width: 300.0,
                                                                                                                    height: 200.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                    errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                      'assets/images/error_image.jpg',
                                                                                                                      width: 300.0,
                                                                                                                      height: 200.0,
                                                                                                                      fit: BoxFit.cover,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 300.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Card(
                                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                        color: Color(0xFFD9EAD3),
                                                                                                        elevation: 4.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsets.all(12.0),
                                                                                                          child: RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: valueOrDefault<String>(
                                                                                                                    containersingleRowBotRow?.msgInicio,
                                                                                                                    'N/A',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 16.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          if (_model.uploadedLocalFile1 != null && (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false)) {
                                                                                            {
                                                                                              safeSetState(() => _model.isDataUploading2 = true);
                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                              var selectedMedia = <SelectedFile>[];
                                                                                              var downloadUrls = <String>[];
                                                                                              try {
                                                                                                selectedUploadedFiles = _model.uploadedLocalFile1.bytes!.isNotEmpty ? [_model.uploadedLocalFile1] : <FFUploadedFile>[];
                                                                                                selectedMedia = selectedFilesFromUploadedFiles(
                                                                                                  selectedUploadedFiles,
                                                                                                  storageFolderPath: 'Fotos Bot',
                                                                                                );
                                                                                                downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                  bucketName: 'Imagens',
                                                                                                  selectedFiles: selectedMedia,
                                                                                                );
                                                                                              } finally {
                                                                                                _model.isDataUploading2 = false;
                                                                                              }
                                                                                              if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                safeSetState(() {
                                                                                                  _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                                });
                                                                                              } else {
                                                                                                safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                            }

                                                                                            await BotTable().update(
                                                                                              data: {
                                                                                                'imagem': _model.uploadedFileUrl2,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                'id',
                                                                                                containersingleRowBotRow?.id,
                                                                                              ),
                                                                                            );
                                                                                            safeSetState(() {
                                                                                              _model.isDataUploading1 = false;
                                                                                              _model.uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                            });

                                                                                            await action_blocks.alertChatfire(
                                                                                              context,
                                                                                              titulo: 'Foto Salva',
                                                                                              cor: 'verde',
                                                                                            );
                                                                                          } else {
                                                                                            await action_blocks.alertChatfire(
                                                                                              context,
                                                                                              titulo: 'Nenhuma imagem selecionada',
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                        text: 'Salvar mudanças',
                                                                                        options: FFButtonOptions(
                                                                                          height: 40.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                color: Colors.white,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                              ),
                                                                                          elevation: 3.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 32.0)),
                                                                                  ),
                                                                                ],
                                                                              ).animateOnPageLoad(animationsMap['wrapOnPageLoadAnimation1']!),
                                                                            ),
                                                                          ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['containerOnPageLoadAnimation6']!),
                                                                      ],
                                                                    ),
                                                                  );
                                                                } else if (_model
                                                                        .paginas ==
                                                                    'mensagens') {
                                                                  return AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            240),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    width:
                                                                        100.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      minWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.75,
                                                                      maxWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.8,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          4.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            32.0,
                                                                            32.0,
                                                                            32.0,
                                                                            24.0),
                                                                        child:
                                                                            Wrap(
                                                                          spacing:
                                                                              0.0,
                                                                          runSpacing:
                                                                              0.0,
                                                                          alignment:
                                                                              WrapAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Mensagens do BOT',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 24.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 240.0,
                                                                                    height: 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x6E9C9C9C),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Mensagem de início da escolha de departamento.',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 500.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.textController1 ??= TextEditingController(
                                                                                                  text: containersingleRowBotRow?.msgInicio != null && containersingleRowBotRow?.msgInicio != '' ? containersingleRowBotRow?.msgInicio : null,
                                                                                                ),
                                                                                                focusNode: _model.textFieldFocusNode1,
                                                                                                autofocus: false,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  alignLabelWithHint: true,
                                                                                                  hintText: 'Escreva aqui',
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        color: Color(0xFF757575),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0xE49C9C9C),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                maxLines: 5,
                                                                                                cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                                validator: _model.textController1Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Mensagem da fila atendimento.',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 500.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.textController2 ??= TextEditingController(
                                                                                                  text: containersingleRowBotRow?.msgFila != null && containersingleRowBotRow?.msgFila != '' ? containersingleRowBotRow?.msgFila : null,
                                                                                                ),
                                                                                                focusNode: _model.textFieldFocusNode2,
                                                                                                autofocus: false,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  alignLabelWithHint: true,
                                                                                                  hintText: 'Escreva aqui',
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        color: Color(0xFF757575),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0xE49C9C9C),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                maxLines: 5,
                                                                                                cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                                validator: _model.textController2Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Mensagem de assumir atendimento.',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 500.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.textFieldassumirTextController ??= TextEditingController(
                                                                                                  text: containersingleRowBotRow?.msgAssumir != null && containersingleRowBotRow?.msgAssumir != '' ? containersingleRowBotRow?.msgAssumir : null,
                                                                                                ),
                                                                                                focusNode: _model.textFieldassumirFocusNode,
                                                                                                autofocus: false,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  alignLabelWithHint: true,
                                                                                                  hintText: 'Escreva aqui',
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        color: Color(0xFF757575),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0xE49C9C9C),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                maxLines: 5,
                                                                                                cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                                validator: _model.textFieldassumirTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Mensagem de finalização chamado.',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 500.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.textController4 ??= TextEditingController(
                                                                                                  text: containersingleRowBotRow?.msgFinalizar != null && containersingleRowBotRow?.msgFinalizar != '' ? containersingleRowBotRow?.msgFinalizar : null,
                                                                                                ),
                                                                                                focusNode: _model.textFieldFocusNode3,
                                                                                                autofocus: false,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  alignLabelWithHint: true,
                                                                                                  hintText: 'Escreva aqui',
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        color: Color(0xFF757575),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0xE49C9C9C),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                maxLines: 5,
                                                                                                cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                                validator: _model.textController4Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 500.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x67BDBDBD),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xE49C9C9C),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(12.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Glossário',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    fontSize: 15.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Protocolo',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                      SelectionArea(
                                                                                                          child: Text(
                                                                                                        '- {{protocolo}}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      )),
                                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Nome do atendente',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      '- {{nome_atendente}}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    )),
                                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 12.0)),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Emoji',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      '- {{emoji_sexo_atendente}}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    )),
                                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Nome do cliente',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      '- {{nome_cliente}}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    )),
                                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 12.0)),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 4.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 58.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 340.0,
                                                                                    height: 600.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                      border: Border.all(
                                                                                        width: 8.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Stack(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      children: [
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.asset(
                                                                                            'assets/images/8c98994518b575bfd8c949e91d20548b.jpg',
                                                                                            width: double.infinity,
                                                                                            height: double.infinity,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 300.0,
                                                                                                height: 200.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Card(
                                                                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                  color: Color(0xFFD9EAD3),
                                                                                                  elevation: 4.0,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (containersingleRowBotRow?.imagem != null && containersingleRowBotRow?.imagem != '')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.network(
                                                                                                              containersingleRowBotRow!.imagem!,
                                                                                                              width: 300.0,
                                                                                                              height: 200.0,
                                                                                                              fit: BoxFit.none,
                                                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                                                'assets/images/error_image.jpg',
                                                                                                                width: 300.0,
                                                                                                                height: 200.0,
                                                                                                                fit: BoxFit.none,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      if (containersingleRowBotRow?.imagem == null || containersingleRowBotRow?.imagem == '')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsets.all(8.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            child: Image.asset(
                                                                                                              'assets/images/8c98994518b575bfd8c949e91d20548b.jpg',
                                                                                                              width: 300.0,
                                                                                                              height: 200.0,
                                                                                                              fit: BoxFit.none,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 300.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Card(
                                                                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                  color: Color(0xFFD9EAD3),
                                                                                                  elevation: 4.0,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsets.all(12.0),
                                                                                                    child: RichText(
                                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                                      text: TextSpan(
                                                                                                        children: [
                                                                                                          TextSpan(
                                                                                                            text: valueOrDefault<String>(
                                                                                                              containersingleRowBotRow?.msgInicio,
                                                                                                              'N/A',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          )
                                                                                                        ],
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 16.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await BotTable().update(
                                                                                      data: {
                                                                                        'msg_inicio': _model.textController1.text,
                                                                                        'msg_fila': _model.textController2.text,
                                                                                        'msg_assumir': _model.textFieldassumirTextController.text,
                                                                                        'msg_finalizar': _model.textController4.text,
                                                                                      },
                                                                                      matchingRows: (rows) => rows.eq(
                                                                                        'id',
                                                                                        containersingleRowBotRow?.id,
                                                                                      ),
                                                                                    );
                                                                                    await action_blocks.alertChatfire(
                                                                                      context,
                                                                                      titulo: 'Mensagens do bot atualizadas.',
                                                                                      cor: 'verde',
                                                                                    );
                                                                                  },
                                                                                  text: 'Salvar mudanças',
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                        ),
                                                                                    elevation: 3.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 32.0)),
                                                                            ),
                                                                          ],
                                                                        ).animateOnPageLoad(animationsMap['wrapOnPageLoadAnimation2']!),
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'containerOnPageLoadAnimation7']!);
                                                                } else if (_model
                                                                        .paginas ==
                                                                    'setores') {
                                                                  return AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            240),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    width:
                                                                        100.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      minWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.75,
                                                                      maxWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.8,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          4.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            32.0,
                                                                            32.0,
                                                                            32.0,
                                                                            24.0),
                                                                        child:
                                                                            Wrap(
                                                                          spacing:
                                                                              0.0,
                                                                          runSpacing:
                                                                              0.0,
                                                                          alignment:
                                                                              WrapAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Gerenciador de Setores',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 24.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 280.0,
                                                                                    height: 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x6E9C9C9C),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Aqui são exibidos os setores cadastrados no sistema. Defina a ordem clicando nas setas.',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final setores = FFAppState().setoresDT.toList();

                                                                                          return ReorderableListView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: setores.length,
                                                                                            itemBuilder: (context, setoresIndex) {
                                                                                              final setoresItem = setores[setoresIndex];
                                                                                              return Container(
                                                                                                key: ValueKey("ListView_uhnvzc7h" + '_' + setoresIndex.toString()),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                      border: Border.all(
                                                                                                        color: Color(0x6E9C9C9C),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsets.all(8.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              (setoresIndex + 1).toString(),
                                                                                                              '1',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              setoresItem.nome,
                                                                                                              'N/A',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                              children: [
                                                                                                                if (!setoresItem.ativo)
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderRadius: 20.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 40.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.not_interested,
                                                                                                                      color: Color(0xFF212121),
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      FFAppState().updateSetoresDTAtIndex(
                                                                                                                        setoresIndex,
                                                                                                                        (e) => e..ativo = true,
                                                                                                                      );
                                                                                                                      safeSetState(() {});
                                                                                                                      _model.setoresMudancas = true;
                                                                                                                      safeSetState(() {});
                                                                                                                    },
                                                                                                                  ),
                                                                                                                if (setoresItem.ativo)
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 20.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 40.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.android_rounded,
                                                                                                                      color: Color(0xFF212121),
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      FFAppState().updateSetoresDTAtIndex(
                                                                                                                        setoresIndex,
                                                                                                                        (e) => e..ativo = false,
                                                                                                                      );
                                                                                                                      safeSetState(() {});
                                                                                                                      _model.setoresMudancas = true;
                                                                                                                      safeSetState(() {});
                                                                                                                    },
                                                                                                                  ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                  child: FFButtonWidget(
                                                                                                                    onPressed: () async {
                                                                                                                      _model.setorResult = await actions.getRowByIdSetores(
                                                                                                                        setoresItem.setor.toString(),
                                                                                                                      );
                                                                                                                      await showModalBottomSheet(
                                                                                                                        isScrollControlled: true,
                                                                                                                        backgroundColor: Colors.transparent,
                                                                                                                        enableDrag: false,
                                                                                                                        context: context,
                                                                                                                        builder: (context) {
                                                                                                                          return GestureDetector(
                                                                                                                            onTap: () => FocusScope.of(context).unfocus(),
                                                                                                                            child: Padding(
                                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                                              child: PopupEditarSetorWidget(
                                                                                                                                setor: _model.setorResult!,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ).then((value) => safeSetState(() {}));

                                                                                                                      context.goNamed('Bot');

                                                                                                                      safeSetState(() {});
                                                                                                                    },
                                                                                                                    text: 'Editar setor',
                                                                                                                    options: FFButtonOptions(
                                                                                                                      height: 35.0,
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 14.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                          ),
                                                                                                                      elevation: 1.0,
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Colors.transparent,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(width: 8.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                          if (false)
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                if (setoresItem.ordem != 1)
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 20.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 40.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.keyboard_arrow_up_sharp,
                                                                                                                      color: Color(0xFF212121),
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      print('IconButton pressed ...');
                                                                                                                    },
                                                                                                                  ),
                                                                                                                FlutterFlowIconButton(
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderRadius: 20.0,
                                                                                                                  borderWidth: 1.0,
                                                                                                                  buttonSize: 40.0,
                                                                                                                  icon: Icon(
                                                                                                                    Icons.keyboard_arrow_down,
                                                                                                                    color: Color(0xFF212121),
                                                                                                                    size: 24.0,
                                                                                                                  ),
                                                                                                                  onPressed: () {
                                                                                                                    print('IconButton pressed ...');
                                                                                                                  },
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            onReorder: (int reorderableOldIndex, int reorderableNewIndex) async {
                                                                                              _model.act = await actions.reorderSetoresState(
                                                                                                FFAppState().setoresDT.toList(),
                                                                                                reorderableOldIndex,
                                                                                                reorderableNewIndex,
                                                                                              );
                                                                                              FFAppState().setoresDT = _model.act!.toList().cast<BotSetoresStruct>();
                                                                                              safeSetState(() {});

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    if (_model.setoresMudancas)
                                                                                      AnimatedDefaultTextStyle(
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        duration: Duration(milliseconds: 600),
                                                                                        curve: Curves.easeIn,
                                                                                        child: Text(
                                                                                          'É necessário salvar mudanças',
                                                                                        ),
                                                                                      ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          enableDrag: false,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return GestureDetector(
                                                                                              onTap: () => FocusScope.of(context).unfocus(),
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                child: PopupCriarSetorWidget(),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));

                                                                                        _model.apiResultdhw7 = await SelectDataGroup.selectJsonSetorCall.call(
                                                                                          refEmpresa: FFAppState().colabUser.refEmpresa,
                                                                                        );

                                                                                        if ((_model.apiResultdhw7?.succeeded ?? true)) {
                                                                                          FFAppState().setoresDT = ((_model.apiResultdhw7?.jsonBody ?? '').toList().map<BotSetoresStruct?>(BotSetoresStruct.maybeFromMap).toList() as Iterable<BotSetoresStruct?>).withoutNulls.toList().cast<BotSetoresStruct>();
                                                                                          safeSetState(() {});
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: 'Novo setor',
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        if (FFAppState().setoresDT.length > 0) {
                                                                                          await BotTable().update(
                                                                                            data: {
                                                                                              'setoresEscolhidos': functions.setoresToJson(FFAppState().setoresDT.toList()),
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id',
                                                                                              containersingleRowBotRow?.id,
                                                                                            ),
                                                                                          );
                                                                                          await actions.updateSetores(
                                                                                            FFAppState().setoresDT.toList(),
                                                                                          );
                                                                                          await action_blocks.alertChatfire(
                                                                                            context,
                                                                                            titulo: 'Setores atualizado',
                                                                                            cor: 'verde',
                                                                                          );
                                                                                        } else {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return AlertDialog(
                                                                                                title: Text('Setores vazios'),
                                                                                                content: Text('Setores vazios'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                    child: Text('Ok'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      text: 'Salvar mudanças',
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                        elevation: 3.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 24.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ).animateOnPageLoad(animationsMap['wrapOnPageLoadAnimation3']!),
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'containerOnPageLoadAnimation8']!);
                                                                } else if (_model
                                                                        .paginas ==
                                                                    'horarios') {
                                                                  return AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            240),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    width:
                                                                        100.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      minWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.75,
                                                                      maxWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.8,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          4.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            32.0,
                                                                            32.0,
                                                                            32.0,
                                                                            24.0),
                                                                        child:
                                                                            Wrap(
                                                                          spacing:
                                                                              0.0,
                                                                          runSpacing:
                                                                              0.0,
                                                                          alignment:
                                                                              WrapAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              WrapCrossAlignment.start,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          runAlignment:
                                                                              WrapAlignment.start,
                                                                          verticalDirection:
                                                                              VerticalDirection.down,
                                                                          clipBehavior:
                                                                              Clip.none,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Horários de funcionamento',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Nunito Sans',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 24.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 330.0,
                                                                                    height: 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x6E9C9C9C),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Switch.adaptive(
                                                                                          value: _model.switchPrincipalValue ??= containersingleRowBotRow!.horariosCostumizados!,
                                                                                          onChanged: (newValue) async {
                                                                                            safeSetState(() => _model.switchPrincipalValue = newValue!);
                                                                                            if (newValue!) {
                                                                                              await action_blocks.alertChatfire(
                                                                                                context,
                                                                                                titulo: 'Preencha os campos para salvar',
                                                                                              );
                                                                                            } else {
                                                                                              await action_blocks.alertChatfire(
                                                                                                context,
                                                                                                titulo: 'Horários resetados',
                                                                                                cor: 'verde',
                                                                                              );
                                                                                              await BotTable().update(
                                                                                                data: {
                                                                                                  'horarios_costumizados': false,
                                                                                                  'funcionamento': FFAppState().JsonHorariosPadrao,
                                                                                                },
                                                                                                matchingRows: (rows) => rows.eq(
                                                                                                  'id',
                                                                                                  containersingleRowBotRow?.id,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                          activeColor: FlutterFlowTheme.of(context).success,
                                                                                          activeTrackColor: Color(0x64249689),
                                                                                          inactiveTrackColor: Color(0x719C9C9C),
                                                                                          inactiveThumbColor: Color(0xFF9C9C9C),
                                                                                        ),
                                                                                        Text(
                                                                                          'Função horário de atendimento',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                    ),
                                                                                  ),
                                                                                  if (_model.switchPrincipalValue ?? true)
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Dias e horários de funcionamento',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 580.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 20.0,
                                                                                              alignment: WrapAlignment.spaceBetween,
                                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 140.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkboxSegValue ??= FFAppState().disponibilidade.segunda.ativo,
                                                                                                          onChanged: (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxSegValue = newValue!);
                                                                                                            if (newValue!) {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateSegunda(
                                                                                                                    (e) => e..ativo = _model.checkboxSegValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            } else {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateSegunda(
                                                                                                                    (e) => e..ativo = _model.checkboxSegValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            }
                                                                                                          },
                                                                                                          side: BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Segunda',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'das',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoSegValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoSegValue ??= FFAppState().disponibilidade.segunda.inicio,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoSegValue = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateSegunda(
                                                                                                            (e) => e..inicio = _model.dropDowntempoSegValue,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'até as',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoSegunda2ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoSegunda2Value ??= FFAppState().disponibilidade.segunda.fim,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoSegunda2Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateSegunda(
                                                                                                            (e) => e..fim = _model.dropDowntempoSegunda2Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 580.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.spaceBetween,
                                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.spaceBetween,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 140.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkboxTerValue ??= FFAppState().disponibilidade.terca.ativo,
                                                                                                          onChanged: (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxTerValue = newValue!);
                                                                                                            if (newValue!) {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateTerca(
                                                                                                                    (e) => e..ativo = _model.checkboxTerValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            } else {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateTerca(
                                                                                                                    (e) => e..ativo = _model.checkboxTerValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            }
                                                                                                          },
                                                                                                          side: BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Terça',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'das',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoTerca1ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoTerca1Value ??= FFAppState().disponibilidade.terca.inicio,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoTerca1Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateTerca(
                                                                                                            (e) => e..inicio = _model.dropDowntempoTerca1Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'até as',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoterca2ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoterca2Value ??= FFAppState().disponibilidade.terca.fim,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoterca2Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateTerca(
                                                                                                            (e) => e..fim = _model.dropDowntempoterca2Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 580.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.spaceBetween,
                                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 140.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkboxQuaValue ??= FFAppState().disponibilidade.quarta.ativo,
                                                                                                          onChanged: (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxQuaValue = newValue!);
                                                                                                            if (newValue!) {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateQuarta(
                                                                                                                    (e) => e..ativo = _model.checkboxQuaValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            } else {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateQuarta(
                                                                                                                    (e) => e..ativo = _model.checkboxQuaValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            }
                                                                                                          },
                                                                                                          side: BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Quarta',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'das',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoQuarta1ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoQuarta1Value ??= FFAppState().disponibilidade.quarta.inicio,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoQuarta1Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateQuarta(
                                                                                                            (e) => e..inicio = _model.dropDowntempoQuarta1Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'até as',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoqua2ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoqua2Value ??= FFAppState().disponibilidade.quarta.fim,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoqua2Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateQuarta(
                                                                                                            (e) => e..fim = _model.dropDowntempoqua2Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 580.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.spaceBetween,
                                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 140.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkboxQuiValue ??= FFAppState().disponibilidade.quinta.ativo,
                                                                                                          onChanged: (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxQuiValue = newValue!);
                                                                                                            if (newValue!) {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateQuinta(
                                                                                                                    (e) => e..ativo = _model.checkboxQuiValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            } else {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateQuinta(
                                                                                                                    (e) => e..ativo = _model.checkboxQuiValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            }
                                                                                                          },
                                                                                                          side: BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Quinta',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'das',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoQuinta1ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoQuinta1Value ??= FFAppState().disponibilidade.quinta.inicio,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoQuinta1Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateQuinta(
                                                                                                            (e) => e..inicio = _model.dropDowntempoQuinta1Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'até as',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoquuiValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoquuiValue ??= FFAppState().disponibilidade.quinta.fim,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoquuiValue = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateQuinta(
                                                                                                            (e) => e..fim = _model.dropDowntempoquuiValue,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 580.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.spaceBetween,
                                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 140.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkboxSexValue ??= FFAppState().disponibilidade.sexta.ativo,
                                                                                                          onChanged: (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxSexValue = newValue!);
                                                                                                            if (newValue!) {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateSexta(
                                                                                                                    (e) => e..ativo = _model.checkboxSexValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            } else {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateSexta(
                                                                                                                    (e) => e..ativo = _model.checkboxSexValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            }
                                                                                                          },
                                                                                                          side: BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Sexta',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'das',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoSexta1ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoSexta1Value ??= FFAppState().disponibilidade.sexta.inicio,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoSexta1Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateSexta(
                                                                                                            (e) => e..inicio = _model.dropDowntempoSexta1Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'até as',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoSex2ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoSex2Value ??= FFAppState().disponibilidade.sexta.fim,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoSex2Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateSexta(
                                                                                                            (e) => e..fim = _model.dropDowntempoSex2Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 580.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.spaceBetween,
                                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.spaceBetween,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 140.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkboxSabValue ??= FFAppState().disponibilidade.sabado.ativo,
                                                                                                          onChanged: (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxSabValue = newValue!);
                                                                                                            if (newValue!) {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateSabado(
                                                                                                                    (e) => e..ativo = _model.checkboxSabValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            } else {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateSabado(
                                                                                                                    (e) => e..ativo = _model.checkboxSabValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            }
                                                                                                          },
                                                                                                          side: BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Sábado',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'das',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoSab1ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoSab1Value ??= FFAppState().disponibilidade.sabado.inicio,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoSab1Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateSabado(
                                                                                                            (e) => e..inicio = _model.dropDowntempoSab1Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'até as',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoSab2ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoSab2Value ??= FFAppState().disponibilidade.sabado.fim,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoSab2Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateSabado(
                                                                                                            (e) => e..fim = _model.dropDowntempoSab2Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 580.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                            child: Wrap(
                                                                                              spacing: 0.0,
                                                                                              runSpacing: 0.0,
                                                                                              alignment: WrapAlignment.spaceBetween,
                                                                                              crossAxisAlignment: WrapCrossAlignment.center,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 140.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Theme(
                                                                                                        data: ThemeData(
                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        ),
                                                                                                        child: Checkbox(
                                                                                                          value: _model.checkboxDomValue ??= FFAppState().disponibilidade.sabado.ativo,
                                                                                                          onChanged: (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxDomValue = newValue!);
                                                                                                            if (newValue!) {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateDomingo(
                                                                                                                    (e) => e..ativo = _model.checkboxDomValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            } else {
                                                                                                              FFAppState().updateDisponibilidadeStruct(
                                                                                                                (e) => e
                                                                                                                  ..updateDomingo(
                                                                                                                    (e) => e..ativo = _model.checkboxDomValue,
                                                                                                                  ),
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                            }
                                                                                                          },
                                                                                                          side: BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                          checkColor: FlutterFlowTheme.of(context).info,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Domingo',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'das',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempoDom1ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempoDom1Value ??= FFAppState().disponibilidade.domingo.inicio,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempoDom1Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateDomingo(
                                                                                                            (e) => e..inicio = _model.dropDowntempoDom1Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'até as',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: FlutterFlowDropDown<String>(
                                                                                                    controller: _model.dropDowntempodom2ValueController ??= FormFieldController<String>(
                                                                                                      _model.dropDowntempodom2Value ??= FFAppState().disponibilidade.domingo.fim,
                                                                                                    ),
                                                                                                    options: functions.horasdodia()!,
                                                                                                    onChanged: (val) async {
                                                                                                      safeSetState(() => _model.dropDowntempodom2Value = val);
                                                                                                      FFAppState().updateDisponibilidadeStruct(
                                                                                                        (e) => e
                                                                                                          ..updateDomingo(
                                                                                                            (e) => e..fim = _model.dropDowntempodom2Value,
                                                                                                          ),
                                                                                                      );
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    width: 150.0,
                                                                                                    height: 40.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintText: 'Selecione',
                                                                                                    icon: Icon(
                                                                                                      Icons.keyboard_arrow_down_rounded,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    elevation: 2.0,
                                                                                                    borderColor: Color(0xFFC4C4C4),
                                                                                                    borderWidth: 1.0,
                                                                                                    borderRadius: 8.0,
                                                                                                    margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                                                                    hidesUnderline: true,
                                                                                                    isSearchable: false,
                                                                                                    isMultiSelect: false,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                    ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (_model.switchPrincipalValue ??
                                                                                true)
                                                                              Form(
                                                                                key: _model.formKey2,
                                                                                autovalidateMode: AutovalidateMode.disabled,
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Mensagem de início da escolha de departamento.',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 400.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.textField9TextController ??= TextEditingController(
                                                                                                  text: containersingleRowBotRow?.msgBotFora,
                                                                                                ),
                                                                                                focusNode: _model.textField9FocusNode,
                                                                                                autofocus: false,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  alignLabelWithHint: true,
                                                                                                  hintText: 'Escreva aqui',
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        color: Color(0xFF757575),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0xE49C9C9C),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                maxLines: 5,
                                                                                                cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                                validator: _model.textField9TextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Setor a ser transferido fora do horário de atendimento',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: FlutterFlowDropDown<int>(
                                                                                            controller: _model.dropDownhorariosValueController ??= FormFieldController<int>(
                                                                                              _model.dropDownhorariosValue ??= containersingleRowBotRow?.setorHorarioFora,
                                                                                            ),
                                                                                            options: List<int>.from(containersetoresSetoresRowList.map((e) => e.id).toList()),
                                                                                            optionLabels: containersetoresSetoresRowList
                                                                                                .map((e) => valueOrDefault<String>(
                                                                                                      e.nome,
                                                                                                      '1',
                                                                                                    ))
                                                                                                .toList(),
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownhorariosValue = val),
                                                                                            width: 400.0,
                                                                                            height: 50.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                            hintText: 'Selecione',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: valueOrDefault<Color>(
                                                                                              FFAppState().dropdownObrigatorios.horariosSetorBot ? FlutterFlowTheme.of(context).error : Color(0xE49C9C9C),
                                                                                              Color(0xE49C9C9C),
                                                                                            ),
                                                                                            borderWidth: 1.0,
                                                                                            borderRadius: 8.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: true,
                                                                                            isSearchable: false,
                                                                                            isMultiSelect: false,
                                                                                          ),
                                                                                        ),
                                                                                        if (FFAppState().dropdownObrigatorios.horariosSetorBot)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Este campo é obrigatório',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                                                                          ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          if (_model.dropDownhorariosValue != null) {
                                                                                            if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                              return;
                                                                                            }
                                                                                            if (_model.dropDownhorariosValue == null) {
                                                                                              FFAppState().updateDropdownObrigatoriosStruct(
                                                                                                (e) => e..horariosSetorBot = true,
                                                                                              );
                                                                                              safeSetState(() {});
                                                                                              return;
                                                                                            }
                                                                                            await BotTable().update(
                                                                                              data: {
                                                                                                'setor_horario_fora': _model.dropDownhorariosValue,
                                                                                                'msg_botFora': _model.textField9TextController.text,
                                                                                                'funcionamento': functions.funcionamentoToJson(FFAppState().disponibilidade),
                                                                                                'horarios_costumizados': true,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                'id_empresa',
                                                                                                FFAppState().colabUser.refEmpresa,
                                                                                              ),
                                                                                            );
                                                                                            FFAppState().updateDropdownObrigatoriosStruct(
                                                                                              (e) => e..horariosSetorBot = false,
                                                                                            );
                                                                                            safeSetState(() {});
                                                                                            await action_blocks.alertChatfire(
                                                                                              context,
                                                                                              titulo: 'Horários de funcionamento atualizados',
                                                                                              cor: 'verde',
                                                                                            );
                                                                                          } else {
                                                                                            FFAppState().updateDropdownObrigatoriosStruct(
                                                                                              (e) => e..horariosSetorBot = true,
                                                                                            );
                                                                                            safeSetState(() {});
                                                                                            if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                              return;
                                                                                            }
                                                                                            if (_model.dropDownhorariosValue == null) {
                                                                                              FFAppState().updateDropdownObrigatoriosStruct(
                                                                                                (e) => e..horariosSetorBot = true,
                                                                                              );
                                                                                              safeSetState(() {});
                                                                                              return;
                                                                                            }
                                                                                          }
                                                                                        },
                                                                                        text: 'Salvar mudanças',
                                                                                        options: FFButtonOptions(
                                                                                          height: 40.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                color: Colors.white,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                              ),
                                                                                          elevation: 3.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 24.0)),
                                                                                ),
                                                                              ).animateOnPageLoad(animationsMap['formOnPageLoadAnimation']!),
                                                                          ],
                                                                        ).animateOnPageLoad(animationsMap['wrapOnPageLoadAnimation4']!),
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'containerOnPageLoadAnimation9']!);
                                                                } else {
                                                                  return AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            240),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    width:
                                                                        100.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      minWidth:
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.75,
                                                                      maxWidth:
                                                                          500.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      elevation:
                                                                          4.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            32.0,
                                                                            32.0,
                                                                            32.0,
                                                                            24.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Configurações',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Nunito Sans',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 24.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 180.0,
                                                                                      height: 1.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x6E9C9C9C),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Switch.adaptive(
                                                                                    value: _model.switchprimordialValue ??= containersingleRowBotRow!.ativo!,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.switchprimordialValue = newValue!);
                                                                                      if (newValue!) {
                                                                                        if (containersingleRowBotRow!.setoresEscolhidos.length >= 1) {
                                                                                          await BotTable().update(
                                                                                            data: {
                                                                                              'ativo': true,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id',
                                                                                              containersingleRowBotRow?.id,
                                                                                            ),
                                                                                          );
                                                                                          await action_blocks.alertChatfire(
                                                                                            context,
                                                                                            titulo: 'Bot Ativado',
                                                                                            cor: 'verde',
                                                                                          );
                                                                                        } else {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return AlertDialog(
                                                                                                title: Text('Setores vazio'),
                                                                                                content: Text('Vá para aba de setores, e defina uma ordem para eles em sua mensagem'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                    child: Text('Ok'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                          safeSetState(() {
                                                                                            _model.switchprimordialValue = false;
                                                                                          });
                                                                                        }
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Selecione um setor para transferência',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    activeTrackColor: Color(0xFF00A944),
                                                                                    inactiveTrackColor: Color(0xFF707070),
                                                                                    inactiveThumbColor: Color(0xFFF5F5F5),
                                                                                  ),
                                                                                  Text(
                                                                                    'Bot ${_model.switchprimordialValue! ? 'Ligado' : 'Desligado'}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                            if (_model.switchprimordialValue ??
                                                                                true)
                                                                              Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(),
                                                                                child: Wrap(
                                                                                  spacing: 20.0,
                                                                                  runSpacing: 0.0,
                                                                                  alignment: WrapAlignment.start,
                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                  direction: Axis.horizontal,
                                                                                  runAlignment: WrapAlignment.start,
                                                                                  verticalDirection: VerticalDirection.down,
                                                                                  clipBehavior: Clip.none,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Tempo para transferência automática (minutos)',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FlutterFlowDropDown<int>(
                                                                                              controller: _model.dropDowntempoTransValueController ??= FormFieldController<int>(
                                                                                                _model.dropDowntempoTransValue ??= containersingleRowBotRow?.tempoTransferencia,
                                                                                              ),
                                                                                              options: List<int>.from(functions.gerarNumeros60()),
                                                                                              optionLabels: functions.gerarMinutos(),
                                                                                              onChanged: (val) => safeSetState(() => _model.dropDowntempoTransValue = val),
                                                                                              width: 400.0,
                                                                                              height: 50.0,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              hintText: 'Tempo em minutos',
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: Color(0xFFC4C4C4),
                                                                                              borderWidth: 1.0,
                                                                                              borderRadius: 8.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                              hidesUnderline: true,
                                                                                              isSearchable: false,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Setor a ser transferido por inatividade',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FlutterFlowDropDown<int>(
                                                                                              controller: _model.dropDownInatValueController ??= FormFieldController<int>(
                                                                                                _model.dropDownInatValue ??= containersingleRowBotRow?.setorInatividade,
                                                                                              ),
                                                                                              options: List<int>.from(containersetoresSetoresRowList.map((e) => e.id).toList()),
                                                                                              optionLabels: containersetoresSetoresRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                              onChanged: (val) => safeSetState(() => _model.dropDownInatValue = val),
                                                                                              width: 400.0,
                                                                                              height: 50.0,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              hintText: 'Setores',
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: Color(0xFFC4C4C4),
                                                                                              borderWidth: 1.0,
                                                                                              borderRadius: 8.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                              hidesUnderline: true,
                                                                                              isSearchable: false,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'Tempo de retorno após encerrar (minutos)',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: FlutterFlowDropDown<int>(
                                                                                              controller: _model.dropDowntempoRetorValueController ??= FormFieldController<int>(
                                                                                                _model.dropDowntempoRetorValue ??= containersingleRowBotRow?.tempoRetorno,
                                                                                              ),
                                                                                              options: List<int>.from(functions.gerarNumeros60()),
                                                                                              optionLabels: functions.gerarMinutos(),
                                                                                              onChanged: (val) => safeSetState(() => _model.dropDowntempoRetorValue = val),
                                                                                              width: 400.0,
                                                                                              height: 50.0,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                              hintText: 'Tempo em minutos',
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: Color(0xFFC4C4C4),
                                                                                              borderWidth: 1.0,
                                                                                              borderRadius: 8.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                              hidesUnderline: true,
                                                                                              isSearchable: false,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation11']!),
                                                                            if (!_model.switchprimordialValue!)
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Form(
                                                                                      key: _model.formKey1,
                                                                                      autovalidateMode: AutovalidateMode.disabled,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Setor a ser transferido automaticamente',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                              child: FlutterFlowDropDown<int>(
                                                                                                controller: _model.dropDownAUTValueController ??= FormFieldController<int>(
                                                                                                  _model.dropDownAUTValue ??= containersingleRowBotRow?.setorTransferidoAutomaticamente,
                                                                                                ),
                                                                                                options: List<int>.from(containersetoresSetoresRowList.map((e) => e.id).toList()),
                                                                                                optionLabels: containersetoresSetoresRowList.map((e) => e.nome).withoutNulls.toList(),
                                                                                                onChanged: (val) => safeSetState(() => _model.dropDownAUTValue = val),
                                                                                                width: 400.0,
                                                                                                height: 50.0,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                hintText: 'Setores',
                                                                                                icon: Icon(
                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                elevation: 2.0,
                                                                                                borderColor: FFAppState().dropdownObrigatorios.setorForaAtendimento ? FlutterFlowTheme.of(context).error : Color(0xFFC4C4C4),
                                                                                                borderWidth: 1.0,
                                                                                                borderRadius: 8.0,
                                                                                                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                hidesUnderline: true,
                                                                                                isSearchable: false,
                                                                                                isMultiSelect: false,
                                                                                              ),
                                                                                            ),
                                                                                            if (FFAppState().dropdownObrigatorios.setorForaAtendimento)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Este campo é obrigatório',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                                                                              ),
                                                                                          ].divide(SizedBox(height: 12.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                ),
                                                                              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation12']!),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      if (_model.switchprimordialValue!) {
                                                                                        if (containersingleRowBotRow!.setoresEscolhidos.length >= 1) {
                                                                                          await BotTable().update(
                                                                                            data: {
                                                                                              'ativo': true,
                                                                                              'tempo_transferencia': _model.dropDowntempoTransValue,
                                                                                              'setor_inatividade': _model.dropDownInatValue,
                                                                                              'tempo_retorno': _model.dropDowntempoRetorValue,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id',
                                                                                              containersingleRowBotRow?.id,
                                                                                            ),
                                                                                          );
                                                                                          await action_blocks.alertChatfire(
                                                                                            context,
                                                                                            titulo: 'Bot Ligado!',
                                                                                            cor: 'verde',
                                                                                          );
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return AlertDialog(
                                                                                                title: Text('Setores vazio'),
                                                                                                content: Text('Vá para aba de setores, e defina uma ordem para eles em sua mensagem'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                    child: Text('Ok'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                          safeSetState(() {
                                                                                            _model.switchprimordialValue = false;
                                                                                          });
                                                                                        }
                                                                                      } else {
                                                                                        await BotTable().update(
                                                                                          data: {
                                                                                            'ativo': false,
                                                                                            'setor_transferido_automaticamente': _model.dropDownAUTValue,
                                                                                            'horarios_costumizados': false,
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eq(
                                                                                            'id',
                                                                                            containersingleRowBotRow?.id,
                                                                                          ),
                                                                                        );
                                                                                        await action_blocks.alertChatfire(
                                                                                          context,
                                                                                          titulo: 'Bot Desligado',
                                                                                          cor: 'vermelho',
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    text: 'Salvar mudanças',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                            color: Colors.white,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                          ),
                                                                                      elevation: 3.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation2']!),
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'containerOnPageLoadAnimation10']!);
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
